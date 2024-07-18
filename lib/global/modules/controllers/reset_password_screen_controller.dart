import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/constants.dart';
import '../../customs/classes/custom_dialog.dart';
import '../../customs/common_code.dart';
import '../../customs/progress_dialogs.dart';
import '../../web_services/user_services.dart';

class ResetPasswordScreenController extends GetxController  {

  TextEditingController resetCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxBool obscureText = true.obs;
  RxBool obscureTextReEnter = true.obs;

  RxBool isCopied = false.obs;

  RxBool validationError = false.obs;

  FocusNode resetCodeFocusNode=FocusNode(),passwordFocusNode=FocusNode();


  RxString userEmail=''.obs;

  void removeFocus(){
    if(resetCodeFocusNode.hasFocus){
      resetCodeFocusNode.unfocus();
    }else if(passwordFocusNode.hasFocus){
      passwordFocusNode.unfocus();
    }
  }


  @override
  onInit(){
    userEmail.value=Get.arguments??"";
    super.onInit();
  }

  Future<void> submit() async {
    removeFocus();
    if (formKey.currentState!.validate() )  {
        validationError.value = false;
        ProgressDialog pd = ProgressDialog();
        pd.showDialog();
        if(await CommonCode().checkInternetAccess()) {
          String resp = await UserServices().resetPassword(
            password: passwordController.text,
            code: resetCodeController.text,
            email: userEmail.value,
          );
          if (resp=='OK') {
            pd.dismissDialog();
            Get.back();
            Get.back();
          }else {
            pd.dismissDialog();
            CustomDialogs().showMessageDialog(title: "Alert",
                description: resp,
                type: DialogType.ERROR);
          }
        } else{
          pd.dismissDialog();
          CustomDialogs().showMessageDialog(title: 'Alert',
              description: kInternetMsg,
              type: DialogType.ERROR);
        }


    }
  }



  @override
  void dispose() {
    resetCodeController.dispose();
    passwordController.dispose();
    resetCodeFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

}