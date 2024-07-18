import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/route_management/app_routes.dart';
import 'dart:io' show Platform;
import '../../constants/constants.dart';
import '../../customs/classes/custom_dialog.dart';
import '../../customs/common_code.dart';
import '../../customs/progress_dialogs.dart';
import '../../web_services/user_services.dart';

class ForgetPasswordScreenController extends GetxController  {
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  FocusNode emailFocusNode=FocusNode();

  final ProgressDialog _progressDialog = ProgressDialog();
  final UserServices _userServices=UserServices();

  RxString errorMessage=''.obs;

  void removeFocus(){
    if(emailFocusNode.hasFocus){
      emailFocusNode.unfocus();
    }
  }

  Future<void> submit() async {
    removeFocus();
    if (formKey.currentState!.validate() ) {
      _progressDialog.showDialog();
      bool isInternet=await CommonCode().checkInternetAccess();
      if(isInternet) {
        var response=await _userServices.forgotPassword(email: emailController.text,platform: Platform.isAndroid?"android":"ios");
        if (response is String && response=="OK") {
          _progressDialog.dismissDialog();
          Get.toNamed(Routes.resetPasswordScreen,arguments: emailController.text);
        } else {
          _progressDialog.dismissDialog();
          errorMessage.value=response;
          scaffoldKey.currentState?.openDrawer();
        }
      } else{
        _progressDialog.dismissDialog();
        CustomDialogs().showMessageDialog(title: 'Alert',
            description: kInternetMsg,
            type: DialogType.ERROR);
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }
}