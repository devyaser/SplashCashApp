import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/constants/colors.dart';
import 'package:splashcashapp/global/customs/classes/custom_scaffold.dart';
import 'package:splashcashapp/global/customs/classes/custom_textfield.dart';
import 'package:splashcashapp/global/customs/classes/cutom_button.dart';
import 'package:splashcashapp/global/customs/text_styles.dart';
import 'package:splashcashapp/global/customs/validations/validations.dart';
import 'package:splashcashapp/global/customs/widget_spacing.dart';
import 'package:splashcashapp/global/modules/controllers/reset_password_screen_controller.dart';

import '../../constants/constants.dart';

class ResetPasswordScreen extends GetView<ResetPasswordScreenController> {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        controller.removeFocus();
      },
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: CustomScaffold(
          scaffoldKey: controller.scaffoldKey,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.verticalSpace,
                  Text("Reset your Password", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.03, color: kPrimaryColor),),
                  Obx(()=> Text("Check your email. Someone from our team sent a code to your email: ${controller.userEmail.value}.", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.015, color: kPrimaryColor,fontFamily: kSecondaryFontFamily),)),
                  Obx(
                        () => CustomTextField(
                      placeHolder: 'New Password',
                      focusNode: controller.passwordFocusNode,
                      controller: controller.passwordController,
                      obscureText: controller.obscureText.value,
                      validator: (value) => Validations.passwordValidation(value),
                      suffix: CupertinoButton(
                          minSize: 0,
                          padding: EdgeInsets.zero,
                          onPressed: () => controller.obscureText.value =
                          !controller.obscureText.value,
                          child: controller.obscureText.value
                              ? const Icon(Icons.visibility_off, color: kPrimaryColor)
                              : const Icon(Icons.visibility, color: kPrimaryColor)),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.03),
                   CustomTextField(
                     inputFormatters: [LengthLimitingTextInputFormatter(8),],
                    focusNode: controller.resetCodeFocusNode,
                    placeHolder: 'Code',
                    controller: controller.resetCodeController,
                    validator: (value) {
                      var val = Validations.resetPasswordCodeValidation(value);
                      /* if(val != null){
                      controller.confirmPassword.value = '';
                    }*/
                      return val;
                    },
                  ),
                  20.verticalSpace,
                  Text("Didn’t receive your reset link?", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.015, color: kPrimaryColor,fontFamily: kSecondaryFontFamily),),
                  RichText(

                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Go Back",

                          style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.016, color: kPrimaryColor, fontFamily: kSecondaryFontFamily, height: 1.0,decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.back();
                            },
                        ),
                        TextSpan(
                          text:" and try again",
                          style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.016, color: kPrimaryColor, fontFamily: kSecondaryFontFamily,height: 1.5),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * 0.05),
                  Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      text: "SUBMIT",
                      onTap: () {
                        controller.submit();
                      },
                    ),
                  ),
                  30.verticalSpace,

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}

