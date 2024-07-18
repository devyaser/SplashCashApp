import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/constants/colors.dart';

import '../../constants/assets.dart';
import '../../constants/constants.dart';
import '../text_styles.dart';


class CustomDialogs {
  static final CustomDialogs _instance = CustomDialogs._internal();

  CustomDialogs._internal();

  factory CustomDialogs() => _instance;

  void showMessageDialog(
      {required String title,
        required String description,
        required DialogType type,
        Function? onOkBtnPressed}) {
    AwesomeDialog(
      dismissOnBackKeyPress: false,
      context: Get.context!,
      dialogType: type,
      headerAnimationLoop: false,
      animType: AnimType.SCALE,
      btnOkColor: type == DialogType.SUCCES ?  kPrimaryColor: kPrimaryColor.withOpacity(0.9),
      buttonsBorderRadius:const BorderRadius.all(Radius.circular(5)),
      buttonsTextStyle: AppTextStyles.semiBold.copyWith(
          color: kWhiteColor,
          fontSize:  Get.height * 0.016,
          fontFamily: kSecondaryFontFamily,
          letterSpacing: 1
      ),
      title: title,
      dismissOnTouchOutside: false,
      titleTextStyle:  AppTextStyles.semiBold.copyWith(
        color:kPrimaryColor ,
        fontSize:  Get.height * 0.028,
        fontFamily: kSecondaryFontFamily,
      ),
      desc: description,
      customHeader: Container(
        margin: const EdgeInsets.all(6),
        child: Image.asset(Assets.splashText,height: 80,width: 80),
      ),
      btnOkOnPress: () {
        if (onOkBtnPressed != null) {
          onOkBtnPressed();
        }
      },
    ).show();
  }

  void showDialog(
      String title, String description, DialogType type, Color btnOkColor,
      {Function? onOkBtnPressed}) {
    AwesomeDialog(
      dismissOnBackKeyPress: false,
      context: Get.context!,
      dialogType: type,
      headerAnimationLoop: false,
      animType: AnimType.SCALE,
      btnOkColor: btnOkColor,
      buttonsBorderRadius:const BorderRadius.all(Radius.circular(5)),
      buttonsTextStyle: AppTextStyles.semiBold.copyWith(
          color: kWhiteColor,
          fontSize:  Get.height * 0.016,
          fontFamily: kSecondaryFontFamily,
          letterSpacing: 1
      ),
      titleTextStyle:  AppTextStyles.semiBold.copyWith(
        color:kPrimaryColor ,
        fontSize:  Get.height * 0.015,
        fontFamily: kSecondaryFontFamily,
      ),
      title: title,
      dismissOnTouchOutside: false,
      desc: description,
      descTextStyle:  AppTextStyles.normal.copyWith(
          fontSize:  Get.height * 0.012,
          fontFamily: kSecondaryFontFamily
      ),
      customHeader: Container(
          margin: const EdgeInsets.all(12.0),
          child: Image.asset(Assets.splashText,height: 80,width: 80)),
      btnOkOnPress: () {
        if (onOkBtnPressed != null) {
          onOkBtnPressed();
        }
      },
    ).show();
  }

  void showErrorDialog(
      String title, String description, DialogType type, Color btnOkColor,
      {Function? onOkBtnPressed}) {
    AwesomeDialog(
      dismissOnBackKeyPress: false,
      context: Get.context!,
      dialogType: type,
      headerAnimationLoop: false,
      animType: AnimType.SCALE,
      btnOkColor: btnOkColor,
      buttonsBorderRadius:const BorderRadius.all(Radius.circular(5)),
      buttonsTextStyle: AppTextStyles.semiBold.copyWith(
          color: kWhiteColor,
          fontSize:  Get.height * 0.016,
          fontFamily: kSecondaryFontFamily,
          letterSpacing: 1
      ),
      titleTextStyle:  AppTextStyles.semiBold.copyWith(
        color:kPrimaryColor ,
        fontSize:  Get.height * 0.016,
        fontFamily: kSecondaryFontFamily,
    ),
      title: title,
      dismissOnTouchOutside: false,
      desc: description,
      customHeader: Container(
        margin: const EdgeInsets.all(12.0),
        child: Image.asset(Assets.splashText,height: 80,width: 80),),
      btnOkOnPress: () {
        if(onOkBtnPressed != null ){onOkBtnPressed();}
      },
    ).show();
  }


}