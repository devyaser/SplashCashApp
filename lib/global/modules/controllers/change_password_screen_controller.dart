import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/customs/user_session_management.dart';
import 'package:splashcashapp/global/modules/model/user_login_model.dart';

import '../../constants/constants.dart';
import '../../customs/classes/custom_dialog.dart';
import '../../customs/common_code.dart';
import '../../customs/progress_dialogs.dart';
import '../../route_management/app_routes.dart';
import '../../web_services/user_services.dart';

class ChangePasswordScreenController extends GetxController  {

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reEnterPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxBool obscureText = true.obs;
  RxBool obscureTextReEnter = true.obs;

  RxBool isCopied = false.obs;

  RxBool validationError = false.obs;
  RxString confirmPassword = ''.obs;

  FocusNode oldPasswordFocusNode=FocusNode(),passwordFocusNode=FocusNode(),confirmPasswordFocusNode=FocusNode();

  UserSession userSession=UserSession();
  Rx<UserLoginModel> userLoginModel=UserLoginModel.empty().obs;

  RxString userEmail=''.obs;

  void removeFocus(){
    if(oldPasswordFocusNode.hasFocus){
      oldPasswordFocusNode.unfocus();
    }else if(passwordFocusNode.hasFocus){
      passwordFocusNode.unfocus();
    }else if(confirmPasswordFocusNode.hasFocus){
      confirmPasswordFocusNode.unfocus();
    }
  }

  Future<void> getUserInfo() async{
    userLoginModel.value=await userSession.getUserLoginModel();
    userEmail.value=userLoginModel.value.email;
  }

  @override
  onInit(){
    getUserInfo();
    super.onInit();
  }

  Future<void> submit() async {
    removeFocus();
    if (formKey.currentState!.validate() )  {
      if (passwordController.text.isNotEmpty && passwordController.text != reEnterPasswordController.text) {
        validationError.value = true;
        confirmPassword.value = "Confirm password did not match";
      } else {
        validationError.value = false;
        confirmPassword.value = '';
        ProgressDialog pd = ProgressDialog();
        pd.showDialog();
        if(await CommonCode().checkInternetAccess()) {
          String resp = await UserServices().changePassword(
            newPassword: reEnterPasswordController.text,
            oldPassword: oldPasswordController.text,
            email: userEmail.value,
          );
          if (resp=='OK') {
            pd.dismissDialog();
            Get.offAllNamed(Routes.dashboard);
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
  }

  Future<void> copyToClipboard(String text) async {
    isCopied.value = true;
    Clipboard.setData(ClipboardData(text: text));
   // showSimpleToast();
    await Future.delayed(const Duration(seconds: 3));
    isCopied.value = false;

  }

  // void showSimpleToast() {
  //   Get.rawSnackbar(
  //
  //     message: "Text copied",
  //     margin: const EdgeInsets.all(20),
  //     borderRadius: 8,
  //     forwardAnimationCurve: Curves.easeOutCubic,
  //     reverseAnimationCurve: Curves.easeInCubic,
  //     duration: Duration(seconds: 1),
  //   );
  // }

  @override
  void dispose() {
    oldPasswordController.dispose();
    passwordController.dispose();
    reEnterPasswordController.dispose();
    oldPasswordFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.unfocus();
    super.dispose();
  }

}