import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/constants/colors.dart';
import 'package:splashcashapp/global/constants/constants.dart';
import 'package:splashcashapp/global/customs/classes/custom_textfield.dart';
import 'package:splashcashapp/global/customs/classes/cutom_button.dart';
import 'package:splashcashapp/global/customs/text_styles.dart';
import 'package:splashcashapp/global/customs/validations/validations.dart';
import 'package:splashcashapp/global/modules/controllers/login_screen_cotnroller.dart';
import 'package:splashcashapp/global/route_management/app_routes.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        controller.removeFocus();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                SizedBox(height: Get.height * 0.04),
                Text("Please log in",style: AppTextStyles.normal.copyWith(
                    fontSize: Get.height * 0.035,
                    color: kTextFieldHintColor
                )),
                SizedBox(height: Get.height * 0.03),

                CustomTextField(
                  focusNode: controller.emailFocusNode,
                  placeHolder: 'Email',
                  controller: controller.emailController,
                  borderColor: kTextFieldHintColor,
                  hintColor: kTextFieldHintColor,
                  textColor: kTextFieldHintColor,
                  validator: (value) =>
                  Validations.emailValidationWidthDomain(
                      controller.emailController.text)
                      ? null
                      : "Enter a valid email",
                ),
                SizedBox(height: Get.height * 0.03),
                Obx(()=> CustomTextField(
                  focusNode: controller.passwordFocusNode,
                  placeHolder: 'Password',
                  controller: controller.passwordController,
                  borderColor: kTextFieldHintColor,
                  hintColor: kTextFieldHintColor,
                  obscureText: controller.obscureText.value,
                  textColor: kTextFieldHintColor,
                  validator: (value) =>
                      Validations.passwordValidation(value),
                  suffix: CupertinoButton(
                      minSize: 0,
                      padding: EdgeInsets.zero,
                      onPressed:()=> controller.obscureText.value = !controller.obscureText.value,
                      child: controller.obscureText.value ?
                      const Icon(Icons.visibility_off,color: kTextFieldHintColor):
                      const Icon(Icons.visibility,color: kTextFieldHintColor)),
                ),
                ),
                SizedBox(height: Get.height * 0.04),
                CupertinoButton(
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  onPressed: ()=>Get.toNamed(Routes.forgetPassword),
                  child: Text("Forgot your password?",style: AppTextStyles.normal.copyWith(
                      decoration: TextDecoration.underline,
                      color: kTextFieldHintColor,
                      fontSize:  Get.height * 0.015,
                      fontFamily: kSecondaryFontFamily
                  )),
                ),

                SizedBox(height: Get.height * 0.06),
                CustomButton(
                  text: "LOGIN",
                  onTap: ()=> controller.login(),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}