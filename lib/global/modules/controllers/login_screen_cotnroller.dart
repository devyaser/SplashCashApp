import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/constants/colors.dart';
import 'package:splashcashapp/global/customs/user_session_management.dart';

import '../../constants/constants.dart';
import '../../customs/classes/custom_dialog.dart';
import '../../customs/common_code.dart';
import '../../customs/progress_dialogs.dart';
import '../../route_management/app_routes.dart';
import '../../web_services/user_services.dart';
import '../model/user_login_model.dart';

class LoginScreenController extends GetxController{


TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

FocusNode emailFocusNode=FocusNode(),passwordFocusNode=FocusNode();
RxBool obscureText = true.obs;

UserSession userSession=UserSession();

void removeFocus(){
  if(emailFocusNode.hasFocus){
    emailFocusNode.unfocus();
  }else if(passwordFocusNode.hasFocus){
    passwordFocusNode.unfocus();
  }
}

 Future<void> login() async {
  removeFocus();
  if (formKey.currentState!.validate())  {
    ProgressDialog pd = ProgressDialog();
    pd.showDialog(loaderColor: kWhiteColor);
    if(await CommonCode().checkInternetAccess()) {
      UserLoginModel userLoginModel = await UserServices().loginUser(
          password: passwordController.text,
          email: emailController.text,
          );
      if (userLoginModel.token.isNotEmpty && userLoginModel.id!='') {
       userSession.createSession(userLoginModel: userLoginModel);
        pd.dismissDialog();
        Get.offAllNamed(Routes.dashboard);
      }else {
        pd.dismissDialog();
        CustomDialogs().showMessageDialog(title: "Alert",
            description: userLoginModel.errorMessage,
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
  void onInit() {
    super.onInit();
  }


@override
void dispose() {
  emailController.dispose();
  passwordController.dispose();
  emailFocusNode.dispose();
  passwordFocusNode.dispose();
  super.dispose();
}
}