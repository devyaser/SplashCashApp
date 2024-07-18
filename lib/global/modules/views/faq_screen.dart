import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/constants/constants.dart';
import 'package:splashcashapp/global/customs/widget_spacing.dart';
import 'package:splashcashapp/global/modules/controllers/faq_screen_controller.dart';
import '../../constants/colors.dart';
import '../../customs/classes/custom_scaffold.dart';
import '../../customs/text_styles.dart';


class FAQsScreen extends GetView<FAQScreenController> {
   const FAQsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: CustomScaffold(
        scaffoldKey: controller.scaffoldKey,
        body: Obx(()=>controller.aboutList.isNotEmpty|| controller.trackingReferralList.isNotEmpty?SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.8,
                  width: Get.width,
                  child: Obx(()=> controller.aboutList.isNotEmpty||controller.trackingReferralList.isNotEmpty ?Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("FAQs", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.05, color: kPrimaryColor),),
                            10.verticalSpace,
                            Text("Find answers to our most commonly asked questions. Tap a question to reveal the answer", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.016,color: kPrimaryColor, fontFamily: kSecondaryFontFamily),),
                            20.verticalSpace,
                            Text("ABOUT SPLASH CASH", style: AppTextStyles.bold.copyWith(fontSize: Get.height * 0.016,color: kPrimaryColor, fontFamily: kSecondaryFontFamily),),
                            5.verticalSpace,
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.aboutList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0,),
                                  child: ExpansionTile(
                                    iconColor: kWhiteColor,
                                    collapsedIconColor: kWhiteColor,
                                    collapsedBackgroundColor: kPrimaryColor,
                                     backgroundColor: kSecondaryColor,
                                    title: Text(controller.aboutList[index].question, style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.018,color: kWhiteColor, fontFamily: kSecondaryFontFamily),),
                                    children: [
                                      Container(
                                          width: Get.width,
                                          color:kWhiteColor,
                                          child: ListTile(
                                            title: Text(controller.aboutList[index].answer),
                                          ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            20.verticalSpace,
                            Text("TRACKING REFERRALS", style: AppTextStyles.bold.copyWith(fontSize: Get.height * 0.016,color: kPrimaryColor, fontFamily: kSecondaryFontFamily),),
                            5.verticalSpace,
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.trackingReferralList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0,),
                                  child: ExpansionTile(
                                    iconColor: kWhiteColor,
                                    collapsedIconColor: kWhiteColor,
                                    collapsedBackgroundColor: kPrimaryColor,
                                     backgroundColor: kSecondaryColor,
                                    title: Text(controller.trackingReferralList[index].question, style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.018,color: kWhiteColor, fontFamily: kSecondaryFontFamily),),
                                    children: [
                                      Container(
                                          width: Get.width,
                                          color:kWhiteColor,
                                          child: ListTile(
                                            title: Text(controller.trackingReferralList[index].answer),
                                          ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ):const SizedBox(),
                  ),
                ),
              ],
            ),
          ):const Center(child: CircularProgressIndicator(
            color: kPrimaryColor,
            strokeWidth: 2,
          ),),
        ),
      ),
    );
  }

}
