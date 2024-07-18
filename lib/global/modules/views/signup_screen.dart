import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/constants/colors.dart';
import 'package:splashcashapp/global/constants/constants.dart';
import 'package:splashcashapp/global/customs/classes/cutom_button.dart';
import 'package:splashcashapp/global/customs/text_styles.dart';
import 'package:splashcashapp/global/customs/validations/validations.dart';
import 'package:splashcashapp/global/customs/widget_spacing.dart';
import 'package:splashcashapp/global/modules/controllers/signup_screen_controller.dart';

import '../../customs/classes/custom_textfield.dart';
import '../../route_management/app_routes.dart';

class SignupScreen extends GetView<SignupScreenController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        controller.removeFocus();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Get.height * 0.04),
                Text("Please Sign up",
                    style: AppTextStyles.normal.copyWith(
                        fontSize: Get.height * 0.035, color: kTextFieldHintColor)),
                SizedBox(height: Get.height * 0.01),
                CustomTextField(
                  focusNode: controller.emailFocusNode,
                  placeHolder: 'Email',
                  controller: controller.emailController,
                  borderColor: kTextFieldHintColor,
                  hintColor: kTextFieldHintColor,
                  textColor: kTextFieldHintColor,
                  validator: (value) => Validations.emailValidationWidthDomain(
                      controller.emailController.text)
                      ? null
                      : "Enter a valid email",
                ),
                SizedBox(height: Get.height * 0.03),
                Obx(
                      () => CustomTextField(
                        focusNode: controller.passwordFocusNode,
                    placeHolder: 'Password',
                    controller: controller.passwordController,
                    borderColor: kTextFieldHintColor,
                    hintColor: kTextFieldHintColor,
                    obscureText: controller.obscureText.value,
                    textColor: kTextFieldHintColor,
                    validator: (value) => Validations.passwordValidation(value),
                    suffix: CupertinoButton(
                        minSize: 0,
                        padding: EdgeInsets.zero,
                        onPressed: () => controller.obscureText.value =
                        !controller.obscureText.value,
                        child: controller.obscureText.value
                            ? const Icon(Icons.visibility_off, color: kTextFieldHintColor)
                            : const Icon(Icons.visibility, color: kTextFieldHintColor)),
                  ),
                ),
                SizedBox(height: Get.height * 0.03),
                Obx(() => CustomTextField(
                  focusNode: controller.confirmPasswordFocusNode,
                  placeHolder: 'Re-enter Password',
                  controller: controller.reEnterPasswordController,
                  borderColor: kTextFieldHintColor,
                  hintColor: kTextFieldHintColor,
                  obscureText: controller.obscureTextReEnter.value,
                  textColor: kTextFieldHintColor,
                  confirmPasswordError:
                  controller.confirmPassword.value != '' &&
                      controller.validationError.value
                      ? true
                      : false,
                  validator: (value) {
                    var val = Validations.passwordValidation(value);
                   /* if(val != null){
                      controller.confirmPassword.value = '';
                    }*/
                    // val != null
                    //     ? controller.confirmPassword.value = ''
                    //     : controller.confirmPassword.value = '';
                    return val;
                  },
                  suffix: CupertinoButton(
                      minSize: 0,
                      padding: EdgeInsets.zero,
                      onPressed: () => controller.obscureTextReEnter.value =
                      !controller.obscureTextReEnter.value,
                      child: controller.obscureTextReEnter.value
                          ? const Icon(Icons.visibility_off, color: kTextFieldHintColor)
                          : const Icon(Icons.visibility, color: kTextFieldHintColor)),
                )),
                Obx(
                      () => controller.confirmPassword.value != '' &&
                      controller.validationError.value
                      ? Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text("Passwords do not match",
                          style: AppTextStyles.semiBold.copyWith(
                              color: kYellowColor,
                              fontSize: Get.height * 0.013,
                              fontFamily: 'Poppins')),
                    ),
                  )
                      : const SizedBox(),
                ),
                SizedBox(height: Get.height * 0.04),
                Text("By clicking sign up,",
                    style: AppTextStyles.normal.copyWith(
                        color: kTextFieldHintColor,
                        fontFamily: kSecondaryFontFamily,

                        fontSize:Get.height * 0.013
                    )),
                7.verticalSpace,
                Text("you agree to the Anthony & Sylvan",
                    style: AppTextStyles.normal.copyWith(
                        color: kTextFieldHintColor,
                        fontFamily: kSecondaryFontFamily,
                        fontSize:Get.height * 0.013)),
                7.verticalSpace,
                GestureDetector(
                 onTap: ()=> Get.toNamed(Routes.termsAndCondition),
                  child: Text("Terms & Conditions",
                      style: AppTextStyles.normal.copyWith(
                          decoration: TextDecoration.underline,
                          fontFamily: kSecondaryFontFamily,
                          color: kTextFieldHintColor, fontSize:Get.height * 0.013)),
                ),
                SizedBox(height: Get.height * 0.04),

                CustomButton(
                  text: "SIGN UP",
                  onTap: () {
                    controller.signup();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}