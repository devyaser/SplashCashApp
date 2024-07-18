import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/constants/constants.dart';

import '../../constants/colors.dart';
import '../text_styles.dart';

class CustomTextField extends StatelessWidget {
  final Widget? prefix;
  final Widget? suffix;
  final String placeHolder;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final double? prefixWidth;
  final int? maxLines;
  final bool? enabled;
  final bool? confirmPasswordError;
  final Color? borderColor;
  final Color? hintColor;
  final Color? textColor;
  final Color? errorColor;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;

  const CustomTextField(
      {this.prefix,
        this.suffix,
        required this.placeHolder,
        required this.controller,
        this.validator,
        this.keyboardType,
        this.obscureText,
        this.onChanged,
        this.prefixWidth,
        this.inputFormatters,
        this.maxLines = 1,
        this.enabled = true,
        this.confirmPasswordError,
        this.borderColor,
        this.errorColor,
        this.hintColor,
        this.textColor,
        this.focusNode,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,

      //decoration: BoxDecoration(
      //borderRadius: BorderRadius.circular(12),
      //border: Border.all(color: Colors.grey[300]!, width: 2),
      //  ),
      child: TextFormField(
        maxLines: maxLines,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        focusNode: focusNode,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        enabled: enabled,
        decoration: inputDecoration(),
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        style: AppTextStyles.normal.copyWith(
            color: confirmPasswordError ==true ? kPrimaryColor:textColor ?? kPrimaryColor,
            fontSize: Get.height * 0.017,
            fontFamily: kSecondaryFontFamily,

        ),

      ),
    );
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
        hintText: placeHolder,

        suffixIcon: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: suffix,
        ),
        hintStyle: AppTextStyles.hintTextStyle.copyWith(
            color: confirmPasswordError == true ? Colors.black:hintColor ?? kPrimaryColor,
            fontSize: Get.height * 0.015,
            fontFamily: kSecondaryFontFamily,
            fontWeight: FontWeight.w200

        ),
        errorStyle: AppTextStyles.semiBold.copyWith(
            color:  errorColor ?? kYellowColor,
            fontSize: Get.height * 0.013,
            fontFamily: kSecondaryFontFamily
        ),

        // prefixIconConstraints: BoxConstraints.expand(
        //     width: prefix == null ? 15 : prefixWidth ?? Get.width * 0.15,
        //     height: prefixWidth != null ? 20 : 17
        // ),

        // suffixIconConstraints: const BoxConstraints(
        //   minHeight: 40
        // ),
        contentPadding: const EdgeInsets.only(top: 23,left: 5),


        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:confirmPasswordError==true ? errorColor ?? kYellowColor: borderColor?? kPrimaryColor), // Set the color here
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: confirmPasswordError==true ? errorColor ?? kYellowColor:borderColor?? kPrimaryColor), // Set the color here
        ),
        filled: true,
        fillColor: confirmPasswordError==true ? kYellowColor : Colors.transparent,
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: errorColor ?? kYellowColor), // Set the color here
        ),

        focusedErrorBorder: UnderlineInputBorder( // Add this line to maintain the same border color on focus during error
          borderSide: BorderSide(color: errorColor ?? kYellowColor),
        ),


        border: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor?? kPrimaryColor), // Set the color here
        ));
  }
}