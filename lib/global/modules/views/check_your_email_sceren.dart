import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/constants/colors.dart';
import 'package:splashcashapp/global/constants/constants.dart';
import 'package:splashcashapp/global/customs/classes/custom_scaffold.dart';
import 'package:splashcashapp/global/customs/text_styles.dart';
import 'package:splashcashapp/global/customs/widget_spacing.dart';

class CheckYourEmailScreen extends StatelessWidget {
   CheckYourEmailScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: CustomScaffold(
        scaffoldKey: scaffoldKey,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Check your email", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.04, color: kPrimaryColor),),
             SizedBox(height: Get.height * 0.05),
              Text("Someone from our team will send a link for you to reset your password shortly.", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.015, color: kPrimaryColor,fontFamily: kSecondaryFontFamily),),
              20.verticalSpace,
              Text("Didn’t receive your reset link?", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.015, color: kPrimaryColor,fontFamily: kSecondaryFontFamily),),
              RichText(

                text: TextSpan(
                 children: [
                   TextSpan(
                      text: "Go Back",

                      style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.016, color: kPrimaryColor, fontFamily: kSecondaryFontFamily, height: 1.0,decoration: TextDecoration.underline),
                     recognizer: TapGestureRecognizer()
                       ..onTap = () {
                         Get.back();
                       },
                   ),
                    TextSpan(
                     text:" and try again",
                      style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.016, color: kPrimaryColor, fontFamily: kSecondaryFontFamily,height: 1.5),
                    ),
                  ],
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
