import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/constants.dart';


class AppTextStyles {
  AppTextStyles._();


  static const loginFontsStyle = TextStyle(
      fontFamily: kFontFamily,
      color: kSecondaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 30,
      letterSpacing: 1.5
  );

  static const light = TextStyle(
    fontFamily: kFontFamily,
    color: kSecondaryColor,
    fontWeight: FontWeight.w300,
  );

  static const normal = TextStyle(
    fontFamily: kFontFamily,
    color: kSecondaryColor,
    fontWeight: FontWeight.w400,
  );

  static const medium = TextStyle(
    fontFamily: kFontFamily,
    color: kPrimaryColor,
    fontWeight: FontWeight.w500,
  );

  static const semiBold = TextStyle(
      fontFamily: kFontFamily,
      color: kSecondaryColor,
      fontWeight: FontWeight.w600,
      fontSize: 18,
      letterSpacing: 0.5
  );

  static const bold = TextStyle(
    fontFamily: kFontFamily,
    color: kSecondaryColor,
    fontWeight: FontWeight.w700,
  );

  static const black = TextStyle(
    fontFamily: kFontFamily,
    color: kSecondaryColor,
    fontWeight: FontWeight.w900,
  );

  static const hintTextStyle = TextStyle(
      fontFamily: kSecondaryFontFamily,
      color: kGreyColor,
      fontWeight: FontWeight.w500,
      fontSize: 12
  );

  static var  large = TextStyle(
    fontFamily: kFontFamily,
    color: kPrimaryColor,
    fontWeight: FontWeight.w400,
    fontSize: Get.height * 0.05,
  );

}