import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/constants/colors.dart';

class Utils {
  static void customToast(title, description) {
    Get.snackbar(
      title,
      description,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
      backgroundColor: title == 'Error' ? Colors.red[400] : Colors.grey[800],
      colorText: Colors.white,
    );
  }
  static Widget backButton({color,arrowColor}){
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        height: Get.height * 0.05,
        width: Get.width * 0.11,
        decoration: BoxDecoration(
          color: color ?? kPrimaryColor,
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Icon(Icons.arrow_back_ios, color: arrowColor ?? Colors.white,size: Get.height * 0.03,),
        ),
      ),
    );
}


  static Widget sliderIndicators(int currentSliderIndex,dots){
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.center,
        child: DotsIndicator(
          dotsCount: dots,
          position: currentSliderIndex,
          decorator: DotsDecorator(
              activeColor: kGreyColor.withOpacity(0.7),
              color: kGreyColor.withOpacity(0.3)),
        ),
      ),

    );
  }
}