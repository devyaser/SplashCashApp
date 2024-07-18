import 'package:get/get.dart';
import 'package:splashcashapp/global/web_services/user_services.dart';

import '../../constants/assets.dart';
import '../../customs/user_session_management.dart';
import '../../route_management/app_routes.dart';
import '../model/user_login_model.dart';

class SplashScreenController extends GetxController{

  String image=Assets.splashWater;
  UserLoginModel userLoginModel=UserLoginModel.empty();
  UserSession userSession=UserSession();

  @override
  void onInit() {
    super.onInit();
   onNavigate();
  }

  Future<void> onNavigate() async{
    userLoginModel= await userSession.getUserLoginModel();
    if(userLoginModel.token!=''){
      String response=await UserServices().isTokenValid();
      if(response=="Success"){
        Get.offAndToNamed(Routes.dashboard);
      }else{
        await Future.delayed(const Duration(seconds: 3));
        Get.offAndToNamed(Routes.authentication);
      }

    }else{
      await Future.delayed(const Duration(seconds: 3));
      Get.offAndToNamed(Routes.authentication);
    }
  }

}