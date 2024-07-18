import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/constants/colors.dart';
import 'package:splashcashapp/global/constants/constants.dart';
import 'package:splashcashapp/global/web_services/user_services.dart';

import '../../customs/classes/custom_dialog.dart';
import '../../customs/common_code.dart';
import '../../customs/progress_dialogs.dart';

class SignupScreenController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reEnterPasswordController = TextEditingController();
  final ProgressDialog _progressDialog = ProgressDialog();
  RxBool obscureText = true.obs;
  RxBool obscureTextReEnter = true.obs;

  RxBool validationError = false.obs;
  RxString confirmPassword = ''.obs;

  FocusNode emailFocusNode=FocusNode(),passwordFocusNode=FocusNode(),confirmPasswordFocusNode=FocusNode();

  final UserServices _userServices=UserServices();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void removeFocus(){
    if(emailFocusNode.hasFocus){
      emailFocusNode.unfocus();
    }else if(passwordFocusNode.hasFocus){
      passwordFocusNode.unfocus();
    }else if(confirmPasswordFocusNode.hasFocus){
      confirmPasswordFocusNode.unfocus();
    }
  }

 Future<void> signup() async {
    removeFocus();
    if (formKey.currentState!.validate() )  {
      if (passwordController.text.isNotEmpty && passwordController.text != reEnterPasswordController.text) {
        validationError.value = true;
        confirmPassword.value = "Confirm password did not match";
      } else {
        validationError.value = false;
        confirmPassword.value = '';
        _progressDialog.showDialog(loaderColor: kWhiteColor);
        bool isInternet=await CommonCode().checkInternetAccess();
        if(isInternet) {
          var response=await _userServices.registerUser(email: emailController.text,password: reEnterPasswordController.text);
          if (response=="OK") {
            _progressDialog.dismissDialog();
           emailController.clear();
           passwordController.clear();
           reEnterPasswordController.clear();
          } else {
            _progressDialog.dismissDialog();
            CustomDialogs().showMessageDialog(
                title: "Alert", description: response, type: DialogType.ERROR);
          }
        } else{
          _progressDialog.dismissDialog();
          CustomDialogs().showMessageDialog(title: 'Alert',
              description: kInternetMsg,
              type: DialogType.ERROR);
        }

      }
    }
  }


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    reEnterPasswordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

}