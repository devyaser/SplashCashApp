import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/constants/assets.dart';
import 'package:splashcashapp/global/modules/model/referral_provider_model.dart';
import 'package:splashcashapp/global/route_management/app_routes.dart';
import 'package:splashcashapp/global/web_services/referral_services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../customs/user_session_management.dart';
import '../model/user_login_model.dart';

class MakeReferralScreenController extends GetxController  {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  RxInt currentSliderIndex = 0.obs;
  RxInt currentScreenSliderIndex = 0.obs;

  Rx<ReferralProviderModel> referralProviderModel=ReferralProviderModel.empty().obs;
  ReferralServices referralServices=ReferralServices();

  UserSession userSession=UserSession();
  Rx<UserLoginModel> userLoginModel=UserLoginModel.empty().obs;
  RxList<Map<String, dynamic>> dataList =<Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    getReferralProvider();
    super.onInit();
  }

  Future<void> getReferralProvider() async{
    userLoginModel.value=await userSession.getUserLoginModel();
    referralProviderModel.value=await referralServices.getReferralProviderModel(email: userLoginModel.value.email.replaceFirst('@', '%40'));
    dataList.value = [
      {
        "path" : Assets.referFormIcon,
        "about" : "Go directly to form",
        "onTap": () async{
          Get.toNamed(Routes.createReferralScreen);
        }
      },
      {
        "path" : Assets.fbIcon,
        "about" : "Share on Facebook",
        "onTap": () async{
          if(referralProviderModel.value.facebookShareUrl!=''){
            launchLinks(link: referralProviderModel.value.facebookShareUrl);
          }
        }
      },
      {
        "path" : Assets.twitterIcon,
        "about" : "Share on X",
        "onTap": () async{
          if(referralProviderModel.value.twitterShareUrl!=''){
            launchLinks(link: referralProviderModel.value.twitterShareUrl);
          }
        }
      },
      {
        "path" : Assets.emailIcon,
        "about" : "Email a link",
        "onTap": () async{
          if(referralProviderModel.value.emailShareUrl!=''){
            launchLinks(link: referralProviderModel.value.emailShareUrl);
          }

        }
      },
      {
        "path" : Assets.textIcon,
        "about" : "Send a link in a text",
        "onTap": () async{
          if(referralProviderModel.value.smsShareUrl!=''){
           launchLinks(link: referralProviderModel.value.smsShareUrl);
          }
        }
      }
    ];
  }

Future<void> launchLinks({required String link}) async{
  final url =
  Uri.encodeFull(link);
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

  void openDrawer()async{
    await Future.delayed(const Duration(seconds: 1));
    scaffoldKey.currentState?.openDrawer();
  }



  @override
  void onClose() {
    super.onClose();
  }


}
