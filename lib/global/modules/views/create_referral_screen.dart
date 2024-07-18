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
import 'package:splashcashapp/global/modules/controllers/create_referral_screen_controller.dart';
import 'package:splashcashapp/global/modules/model/state_model.dart';

import '../../constants/constants.dart';
import '../../customs/classes/custom_link_widget.dart';

class CreateReferralScreen extends GetView<CreateReferralScreenController> {
  const CreateReferralScreen({super.key});

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
                  Text("Create Referral", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.03, color: kPrimaryColor),),
                  CustomTextField(
                      placeHolder: 'First Name',
                      focusNode: controller.fNameFN,
                      controller: controller.firstNameController,
                      validator: (value) => Validations.nameValidation(value),
                    ),
                  SizedBox(height: Get.height * 0.03),
                  CustomTextField(
                      placeHolder: 'Last Name',
                      focusNode: controller.lNFocusNode,
                      controller: controller.lastNameController,
                      validator: (value) => Validations.nameValidation(value),
                    ),
                  SizedBox(height: Get.height * 0.03),
                  CustomTextField(
                    placeHolder: 'Email Address',
                    focusNode: controller.emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController,
                    validator: (value) =>
                    Validations.emailValidationWidthDomain(
                        controller.emailController.text)
                        ? null
                        : "Enter a valid email",
                  ),
                  SizedBox(height: Get.height * 0.03),
                  CustomTextField(
                    placeHolder: 'Home Phone number',
                    focusNode: controller.hPFocusNode,
                    keyboardType: TextInputType.phone,
                    controller: controller.homePoneController,
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    validator: (value) => Validations.validatePhoneNumber(
                        controller.homePoneController.text)
                        ? null
                        : "Enter a valid phone number",
                  ),
                  SizedBox(height: Get.height * 0.03),
                  CustomTextField(
                    placeHolder: 'Work Phone number',
                    focusNode: controller.wPFocusNode,
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    keyboardType: TextInputType.phone,
                    controller: controller.workPhoneController,
                    validator: (value) => Validations.validatePhoneNumber(
                        controller.workPhoneController.text)
                        ? null
                        : "Enter a valid phone number",
                  ),
                  SizedBox(height: Get.height * 0.03),
                  CustomTextField(
                    placeHolder: 'House Number',
                    focusNode: controller.homeNFocusNode,
                    controller: controller.houseNumController,
                    validator: (value) => Validations.commonValidation(value),
                  ),
                  SizedBox(height: Get.height * 0.03),
                  CustomTextField(
                    placeHolder: 'Street Address',
                    focusNode: controller.streetAddFocusNode,
                    controller: controller.streetAddressController,
                    //validator: (value) => Validations.commonValidation(value),
                  ),
                  SizedBox(height: Get.height * 0.03),
                  CustomTextField(
                    placeHolder: 'City',
                    focusNode: controller.cityFocusNode,
                    controller: controller.cityController,
                    validator: (value) => Validations.commonValidation(value),
                  ),
                  SizedBox(height: Get.height * 0.03),
                  Obx(()=> controller.listOfState.isNotEmpty?Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        color: kPrimaryColor.withOpacity(0.2),
                        border: Border.all(color: controller.isStateSelected.value?kYellowColor:kPrimaryColor)
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton(
                      isExpanded: true,
                      underline: Container(),
                      // Initial Value
                      value: controller.selectedState.value,
                      style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.015, color: kPrimaryColor,fontFamily: kSecondaryFontFamily),
                      icon: Icon(Icons.keyboard_arrow_down,color: controller.isStateSelected.value?kYellowColor:kPrimaryColor,),
                      items: controller.listOfState.map((StateModel items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items.state, style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.015, color: kPrimaryColor,fontFamily: kSecondaryFontFamily),),
                        );
                      }).toList(),
                      onChanged: (StateModel? newValue) {
                        controller.selectedState.value = newValue!;
                      },
                    ),
                  ):const SizedBox(),
                  ),
                  SizedBox(height: Get.height * 0.01),
                  CustomTextField(
                    placeHolder: 'Zip',
                    focusNode: controller.zipFocusNode,
                    controller: controller.zipController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [LengthLimitingTextInputFormatter(6)],
                    validator: (value) => Validations.commonValidation(value,length: 5),
                  ),
                  SizedBox(height: Get.height * 0.03),
                  Obx(()=> Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          color: kPrimaryColor.withOpacity(0.2),
                          border: Border.all(color: controller.isSelected.value?kYellowColor:kPrimaryColor)
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButton(
                            isExpanded: true,
                            underline: Container(),
                            // Initial Value
                            value: controller.droDowValue.value,
                            style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.015, color: kPrimaryColor,fontFamily: kSecondaryFontFamily),
                            icon: Icon(Icons.keyboard_arrow_down,color: controller.isSelected.value?kYellowColor:kPrimaryColor,),
                            items: controller.items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items, style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.015, color: kPrimaryColor,fontFamily: kSecondaryFontFamily),),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              controller.droDowValue.value = newValue!;
                            },
                          ),
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

