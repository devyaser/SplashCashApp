import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/constants/assets.dart';
import 'package:splashcashapp/global/customs/user_session_management.dart';
import 'package:splashcashapp/global/modules/model/marketing_notification_model.dart';
import 'package:splashcashapp/global/modules/model/referral_notifications_model.dart';
import 'package:splashcashapp/global/modules/model/user_login_model.dart';
import 'package:splashcashapp/global/route_management/app_routes.dart';
import 'package:splashcashapp/global/web_services/marketing_services.dart';
import 'package:splashcashapp/global/web_services/referral_services.dart';

import '../../constants/constants.dart';
import '../../customs/classes/custom_dialog.dart';
import '../../customs/common_code.dart';

class DashboardScreenController extends GetxController  {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxBool isLoading = false.obs;
  RxInt currentSliderIndex = 0.obs;
  RxInt currentScreenSliderIndex = 0.obs;

  UserSession userSession=UserSession();
  Rx<UserLoginModel> userLoginModel=UserLoginModel.empty().obs;

  RxList<Map<String, dynamic>> dataList = [
    {
      "path" : Assets.referIcon,
      "about" : "Refer someone you know",
      "onTap": (){
      Get.toNamed(Routes.makeReferralScreen);
      }
    },
    {
      "path" : Assets.trackReferral,
      "about" : "Track referrals & rewards",
      "onTap": (){
        Get.toNamed(Routes.trackReferralScreen);
      }
    },
    {
      "path" : Assets.myAccount,
      "about" : "My account",
      "onTap": (){
      Get.toNamed(Routes.changePassword);
      }
    },
    {
      "path" : Assets.contactUs,
      "about" : "Contact us",
      "onTap": (){
        Get.toNamed(Routes.contactUsScreen);
      }
    },
    {
      "path" : Assets.more,
      "about" : "More options",
      "onTap": (){
        Get.toNamed(Routes.alwaysMore);
      }
    }
  ].obs;

  RxBool isDrawerShow=false.obs;

  RxList<MarketingNotificationModel> marketingNotificationModel=<MarketingNotificationModel>[].obs;
  RxList<ReferralNotificationModel> referralNotificationModelList=<ReferralNotificationModel>[].obs;
  MarketingServices marketingService=MarketingServices();
  ReferralServices referralServices=ReferralServices();
  RxString notificationContent=''.obs;


  Future<void> getMarketingInfo() async{
    marketingNotificationModel.value=await marketingService.getMarketingNotificationModel();
    userLoginModel.value=await userSession.getUserLoginModel();
    if(userLoginModel.value.id!=""){
      referralNotificationModelList.value= await referralServices.getReferralNotificationModel(userId: userLoginModel.value.id);
    }

  }


  void openDrawer()async{
    scaffoldKey.currentState?.openDrawer();
  }

  Future<void> markAsRead({required ReferralNotificationModel notification}) async{
    if(await CommonCode().checkInternetAccess()) {
      String resp = await referralServices.markNotificationAsRead(notificationId: notification.id);
      if (resp=='OK') {
            referralNotificationModelList.remove(notification);
        }
      else {
        CustomDialogs().showMessageDialog(title: "Alert",
            description: 'Something went wrong',
            type: DialogType.ERROR);
      }
    } else{
      CustomDialogs().showMessageDialog(title: 'Alert',
          description: kInternetMsg,
          type: DialogType.ERROR);
    }
  }


  @override
  void onInit() {
    getLoginInfo();
    super.onInit();
  }

  Future<void> getLoginInfo() async{
    await getMarketingInfo();
    isDrawerShow.value=true;
    isDrawerShow.value=await userSession.isUserFirstLoggedIn();
    if(isDrawerShow.value){
      for(int i=0;i<marketingNotificationModel.length;i++){
        if(marketingNotificationModel[i].active){
          notificationContent.value=marketingNotificationModel[i].notificationContent;
          openDrawer();
        }
      }
      UserSession().firstTimeLoggedIN();
    }
  }


}
