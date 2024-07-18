import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/customs/widget_spacing.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../customs/classes/custom_scaffold.dart';
import '../../customs/text_styles.dart';
import '../../route_management/app_routes.dart';

class AboutAppScreen extends StatelessWidget {
 AboutAppScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: CustomScaffold(
        scaffoldKey: scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(

                  height: Get.height * 0.8,
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("About this app", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.05, color: kPrimaryColor),),
                          30.verticalSpace,
                           Text("VERSION 1.0", style: AppTextStyles.bold.copyWith(fontSize: Get.height * 0.016, color: kPrimaryColor, fontFamily: kSecondaryFontFamily),),
                          20.verticalSpace,
                          Text("Developed and updated by Anthony & Sylvan",style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.016, color: kPrimaryColor, fontFamily: kSecondaryFontFamily),),
                          20.verticalSpace,
                          Text("Last update XXXXXXX",style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.016, color: kPrimaryColor, fontFamily: kSecondaryFontFamily),),
                          30.verticalSpace,
                          GestureDetector(
                            onTap: ()=> Get.toNamed(Routes.termsAndCondition),
                            child:  Text('Terms & Condition',style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.016, color: kPrimaryColor,decoration: TextDecoration.underline, fontFamily: kSecondaryFontFamily)),
                          ),
                          20.verticalSpace,
                          GestureDetector(
                            onTap: ()=> Get.toNamed(Routes.privacyPolicy),
                            child:  Text(
                                'Privacy Policy',style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.016, color: kPrimaryColor,decoration: TextDecoration.underline, fontFamily: kSecondaryFontFamily)
                              ),
                          ),
                        ]),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
