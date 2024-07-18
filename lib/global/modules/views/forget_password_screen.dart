import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/constants/colors.dart';
import 'package:splashcashapp/global/constants/constants.dart';
import 'package:splashcashapp/global/customs/classes/custom_scaffold.dart';
import 'package:splashcashapp/global/customs/classes/custom_textfield.dart';
import 'package:splashcashapp/global/customs/classes/cutom_button.dart';
import 'package:splashcashapp/global/customs/text_styles.dart';
import 'package:splashcashapp/global/customs/validations/validations.dart';
import 'package:splashcashapp/global/customs/widget_spacing.dart';
import 'package:splashcashapp/global/modules/controllers/forget_password_screen_controller.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordScreenController> {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        controller.removeFocus();
      },
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: Obx(()=> CustomScaffold(
            notificationDesc: controller.errorMessage.value,
            notificationTitle: 'Whoops!',
            scaffoldKey: controller.scaffoldKey,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Forgot my password", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.04, color: kPrimaryColor),),
                    10.verticalSpace,
                    Text("It's ok - it happens to the best of us", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.015, color: kPrimaryColor,fontFamily: kSecondaryFontFamily),),
                    20.verticalSpace,
                    Text("Please enter the email you used to register and we will send you a link to reset your password.", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.015, color: kPrimaryColor,fontFamily: kSecondaryFontFamily),),
                    CustomTextField(
                      focusNode: controller.emailFocusNode,
                      placeHolder: 'Email',
                      controller: controller.emailController,
                      validator: (value) => Validations.emailValidationWidthDomain(
                          controller.emailController.text)
                          ? null
                          : "Enter a valid email",
                    ),
                    SizedBox(height: Get.height * 0.06),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                        text: "SUBMIT",
                        onTap: () {
                         controller.submit();
                        },
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
