import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/constants/colors.dart';
import 'package:splashcashapp/global/constants/constants.dart';
import 'package:splashcashapp/global/customs/classes/custom_scaffold.dart';
import 'package:splashcashapp/global/customs/text_styles.dart';
import 'package:splashcashapp/global/customs/widget_spacing.dart';
import 'package:splashcashapp/global/modules/controllers/track_referral_screen_controller.dart';

import '../../customs/classes/cunstom_mini_boxes.dart';
import '../../customs/utils.dart';
import '../model/member_referral_model.dart';

class TrackReferralScreen extends GetView<TrackReferralScreenController> {
  const TrackReferralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: CustomScaffold(
        scaffoldKey: controller.scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            width: Get.width,
            padding:  const EdgeInsets.symmetric(horizontal: 20.0),
            child:  Obx(()=>controller.approvedReferral.isNotEmpty || controller.qualifiedReferral.isNotEmpty || controller.pendingReferral.isNotEmpty? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.05),
                  Text("Track your referrals & rewards", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.04, color: kPrimaryColor),),
                  Text("Check the dashboard to see if any of your friends or family have taken the plunge with Anthony & Sylvan.", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.015, color: kPrimaryColor,fontFamily: kSecondaryFontFamily),),
                  20.verticalSpace,
                  Text("DESIGN CONSULTATION SCHEDULED".toUpperCase(), style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.018, color: kPrimaryColor,fontFamily: kSecondaryFontFamily,fontWeight: FontWeight.w700),),
                  controller.pendingReferral.isNotEmpty && controller.pendingReferral.length>1?Column(
                      children: [
                        pendingReferralScreenSlider(pendingReferrals:controller.pendingReferral ),
                       Utils.sliderIndicators(controller.currentScreenPendingSliderIndex.value,controller.pendingReferral.length),

                      ],
                    ):
                    controller.pendingReferral.isNotEmpty && controller.pendingReferral.length==1?CustomMiniBoxes(
                      name: controller.pendingReferral[0].referralFirstName,
                      about: controller.pendingReferral[0].referralStatus,
                    ):const CustomMiniBoxes(
                      bgColor: Colors.transparent,
                      about: "Sorry no pending referral at this time",
                    ),
                  10.verticalSpace,
                  Text("CONTRACT SIGNED".toUpperCase(), style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.018, color: kPrimaryColor,fontFamily: kSecondaryFontFamily,fontWeight: FontWeight.w700),),
                  10.verticalSpace,
                  controller.qualifiedReferral.isNotEmpty && controller.qualifiedReferral.length>1?Column(
                    children: [
                      qualifiedReferralScreenSlider(qualifiedReferrals:controller.qualifiedReferral ),
                      Utils.sliderIndicators(controller.currentScreenQualifiedSliderIndex.value,controller.qualifiedReferral.length),

                    ],
                  ):
                  controller.qualifiedReferral.isNotEmpty && controller.qualifiedReferral.length==1?CustomMiniBoxes(
                    name: controller.qualifiedReferral[0].referralFirstName,
                    about: controller.qualifiedReferral[0].referralStatus,
                  ):const CustomMiniBoxes(
                    bgColor: Colors.transparent,
                    about: "Sorry no qualified referral at this time",
                  ),
                  10.verticalSpace,
                  Text("REWARD COMING".toUpperCase(), style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.018, color: kPrimaryColor,fontFamily: kSecondaryFontFamily,fontWeight: FontWeight.w700),),
                  10.verticalSpace,
                 controller.approvedReferral.isNotEmpty && controller.approvedReferral.length>1?Column(
                    children: [
                      approvedReferralScreenSlider(approvedReferrals:controller.approvedReferral ),
                      Utils.sliderIndicators(controller.currentScreenApprovedSliderIndex.value,controller.approvedReferral.length),

                    ],
                  ):
                  controller.approvedReferral.isNotEmpty && controller.approvedReferral.length==1?CustomMiniBoxes(
                    name: controller.approvedReferral[0].referralFirstName,
                    about: controller.approvedReferral[0].referralStatus,
                  ):const CustomMiniBoxes(
                    bgColor: Colors.transparent,
                    about: "Sorry no qualified referral at this time",
                  ),
                  10.verticalSpace,
                ],
              ):const Center(child: CircularProgressIndicator(
                color: kPrimaryColor,
                strokeWidth: 2,
              ),),
            ),
          ),
        ),
      ),
    );
  }

  Widget pendingReferralScreenSlider({required List<PendingReferrals> pendingReferrals}) {

    List<CustomMiniBoxes> customMiniBoxesList = [];
    for(var data in pendingReferrals){
      customMiniBoxesList.add(
        CustomMiniBoxes(
          name: data.referralFirstName,
          about: data.referralStatus,
        ),
      );
    }
    return SizedBox(
      height: Get.height * 0.17,
      width: Get.width,
      child: CarouselSlider(
        items:customMiniBoxesList,
        options: CarouselOptions(
          viewportFraction: 0.37,
          padEnds: false,
          onPageChanged: (index, reason) => controller.currentScreenPendingSliderIndex.value = index,
          autoPlay: false,
        ),
      ),
    );
  }

  Widget approvedReferralScreenSlider({required List<ApprovedReferrals> approvedReferrals}) {

    List<CustomMiniBoxes> customMiniBoxesList = [];
    for(var data in approvedReferrals){
      customMiniBoxesList.add(
        CustomMiniBoxes(
          name: data.referralFirstName,
          about: data.referralStatus,
        ),
      );
    }
    return SizedBox(
      height: Get.height * 0.17,
      width: Get.width,
      child: CarouselSlider(
        items:customMiniBoxesList,
        options: CarouselOptions(
          viewportFraction: 0.37,
          padEnds: false,
          onPageChanged: (index, reason) => controller.currentScreenApprovedSliderIndex.value = index,
          autoPlay: false,
        ),
      ),
    );
  }

  Widget qualifiedReferralScreenSlider({required List<QualifiedReferrals> qualifiedReferrals}) {

    List<CustomMiniBoxes> customMiniBoxesList = [];
    for(var data in qualifiedReferrals){
      customMiniBoxesList.add(
        CustomMiniBoxes(
          name: data.referralFirstName,
          about: data.referralStatus,
        ),
      );
    }
    return SizedBox(
      height: Get.height * 0.17,
      width: Get.width,
      child: CarouselSlider(
        items:customMiniBoxesList,
        options: CarouselOptions(
          viewportFraction: 0.37,
          padEnds: false,
          onPageChanged: (index, reason) => controller.currentScreenQualifiedSliderIndex.value = index,
          autoPlay: false,
        ),
      ),
    );
  }
}
