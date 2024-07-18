import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/constants/colors.dart';
import 'package:splashcashapp/global/constants/constants.dart';
import 'package:splashcashapp/global/customs/classes/custom_link_widget.dart';
import 'package:splashcashapp/global/customs/classes/custom_scaffold.dart';
import 'package:splashcashapp/global/customs/text_styles.dart';
import 'package:splashcashapp/global/customs/widget_spacing.dart';
import 'package:splashcashapp/global/modules/controllers/make_referral_screen_controller.dart';

import '../../customs/classes/cunstom_mini_boxes.dart';
import '../../customs/utils.dart';

class MakeReferralScreen extends GetView<MakeReferralScreenController> {
  const MakeReferralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      // color: kBackgroundColor,
      child: CustomScaffold(
        scaffoldKey: controller.scaffoldKey,
          notificationDesc: "You successfully shared the consultation form via <facebook, twitter, email or text>",
          notificationTitle: "Congratulations and thank you!",
          body: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child:  Container(
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Get.height * 0.05),
                        Text("Make a referral", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.04, color: kPrimaryColor),),
                        Text("There are many ways to spread the word about Anthony & Sylvan. Choose one below and refer someone today.", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.015, color: kPrimaryColor,fontFamily: kSecondaryFontFamily),),
                        20.verticalSpace,
                        Text("Share our FREE CONSULTATION form:", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.015, color: kPrimaryColor,fontFamily: kSecondaryFontFamily),),
                        10.verticalSpace,
                        Obx(()=> controller.dataList.isNotEmpty?Column(
                           children: [
                             screensSlider(),
                            Utils.sliderIndicators(controller.currentScreenSliderIndex.value,controller.dataList.length),
                           ],
                          ) :const Center(
                            child:CircularProgressIndicator(
                              color: kPrimaryColor,
                              strokeWidth: 2,
                            ),
                          ),
                        ),
                        20.verticalSpace,
                        Obx(()=>CustomLinkWidget(link: controller.userLoginModel.value.userShareLinks.shareUrl,onTap: () async{
                           await Clipboard.setData(ClipboardData(text: controller.userLoginModel.value.userShareLinks.shareUrl));
                          },
                        )),
                      ],
                    ),
                  ),
              )
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
        //   child: Column(
        //     children: [
        //       SizedBox(height: Get.height * 0.05),
        //       Align(
        //           alignment: Alignment.bottomLeft,
        //           child: Utils.backButton()),
        //       10.verticalSpace,

        //
        //     ],
        //   ),
        // ),
      ),
    );
  }

  Widget screensSlider() {

    List<CustomMiniBoxes> customMiniBoxesList = [];
    for(var data in controller.dataList){
      customMiniBoxesList.add(
        CustomMiniBoxes(
          about: data['about'],
          imagePath: data['path'],
          onTap: data['onTap'],
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
          onPageChanged: (index, reason) => controller.currentScreenSliderIndex.value = index,
          autoPlay: false,
        ),
      ),
    );
  }
}
