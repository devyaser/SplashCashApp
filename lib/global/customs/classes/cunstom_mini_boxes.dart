import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:splashcashapp/global/customs/text_styles.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';

class CustomMiniBoxes extends StatelessWidget {
  final String about;
  final String? imagePath;
  final String? name;
  final Color? bgColor;
  final VoidCallback? onTap;

  const CustomMiniBoxes({required this.about, super.key, this.imagePath='', this.onTap,this.name='',this.bgColor=kWhiteColor});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 0.0,
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
          width:Get.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.13,
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0,left: 10.0, top: 10.0,bottom: 2.0),
                child: name!=''?Center(
                  child: Text(name??'',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bold.copyWith(fontSize: Get.height * 0.017, color: kPrimaryColor, fontFamily: kSecondaryFontFamily,fontWeight: FontWeight.w700),),
                ):name==''&& imagePath==''?SizedBox():SizedBox(
                  height: Get.height * 0.035,
                    child: Image.asset(imagePath??'')),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: Center(
                    child: Text(about,
                      textAlign: TextAlign.center,
                      style: name!=''?AppTextStyles.light.copyWith(fontSize: Get.height * 0.016, color: kPrimaryColor, fontFamily: kSecondaryFontFamily):AppTextStyles.bold.copyWith(fontSize: Get.height * 0.016, color: kPrimaryColor, fontFamily: kSecondaryFontFamily),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
