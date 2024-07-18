import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreenController extends GetxController with GetSingleTickerProviderStateMixin {

  late TabController tabController = TabController(length: 2, vsync: this);
  RxBool isSwitched = false.obs;
  RxBool isLoginTapped = true.obs;
  RxBool isSignupTapped = true.obs;


  onTapChange(value){
    if(value == 'login'){
      isLoginTapped.value = true;
      isSignupTapped.value = false;
    }else{
      isLoginTapped.value = false;
      isSignupTapped.value = true;
    }
  }

  onTapChange2(bool value){
      isLoginTapped.value = value;
  }


  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}