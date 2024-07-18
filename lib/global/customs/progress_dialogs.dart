import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:splashcashapp/global/constants/colors.dart';
import 'package:splashcashapp/global/customs/text_styles.dart';

import '../constants/constants.dart';


class ProgressDialog {

  static final ProgressDialog _instance = ProgressDialog._internal();
  ProgressDialog._internal();
  factory ProgressDialog() => _instance;

  bool _isShowing = false;

  void showDialog({String? title,Color loaderColor=kPrimaryColor}){
    if(_isShowing)return;

    _isShowing = true;
    Get.dialog(
       WillPopScope(
         onWillPop: (){
           return Future.value(false);
         },
         child: Container(
            color: Colors.transparent,
            margin: const EdgeInsets.only(left: 12, right: 12),
            child: Center(child:  CircularProgressIndicator(color: loaderColor,)),
          ),
       ),
        barrierDismissible: true,

    );
  }

  void dismissDialog() {
    if (_isShowing) {
      _isShowing = false;
      Get.back();
    }
  }
}