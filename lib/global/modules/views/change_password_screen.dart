import 'package:flutter/cupertino.dart';
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
import 'package:splashcashapp/global/modules/controllers/change_password_screen_controller.dart';

import '../../customs/classes/custom_link_widget.dart';

class ChangePasswordScreen extends GetView<ChangePasswordScreenController> {
  const ChangePasswordScreen({super.key});

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
                Text("My Account", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.04, color: kPrimaryColor),),
                10.verticalSpace,
                Obx(()=>CustomLinkWidget(link: controller.userLoginModel.value.userShareLinks.shareUrl,onTap: () async{
                  await Clipboard.setData(ClipboardData(text: controller.userLoginModel.value.userShareLinks.shareUrl));
                },
                )),
                30.verticalSpace,
                Text("Change password", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.03, color: kPrimaryColor),),

                Obx(
                      () => CustomTextField(
                    placeHolder: 'Old Password',
                    focusNode: controller.oldPasswordFocusNode,
                    controller: controller.oldPasswordController,
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
                Obx(() => CustomTextField(
                  focusNode: controller.confirmPasswordFocusNode,
                  placeHolder: 'Re-enter Password',
                  controller: controller.reEnterPasswordController,

                  obscureText: controller.obscureTextReEnter.value,
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
                    return val;
                  },
                  suffix: CupertinoButton(
                    minSize: 0,
                    padding: EdgeInsets.zero,
                    onPressed: () => controller.obscureTextReEnter.value =
                    !controller.obscureTextReEnter.value,
                    child: controller.obscureTextReEnter.value
                        ?  const Icon(Icons.visibility_off,
                        color: kPrimaryColor):
                        const Icon(Icons.visibility,
                        color: kPrimaryColor),
                  ),
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

