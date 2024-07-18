import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/constants/assets.dart';
import 'package:splashcashapp/global/constants/colors.dart';
import 'package:splashcashapp/global/customs/text_styles.dart';
import 'package:splashcashapp/global/customs/widget_spacing.dart';
import 'package:splashcashapp/global/modules/controllers/always_more_screen_controller.dart';

import '../../constants/constants.dart';
import '../../customs/classes/cunstom_mini_boxes.dart';
import '../../customs/classes/custom_icon_button.dart';
import '../../customs/classes/custom_scaffold.dart';

class AlwaysMoreScreen extends GetView<AlwaysMoreScreenController> {
  const AlwaysMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: CustomScaffold(
        scaffoldKey: controller.scaffoldKey,
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
                        Text(
                          "There's always",
                          style: AppTextStyles.normal.copyWith(
                              fontSize: Get.height * 0.05,
                              color: kPrimaryColor),
                        ),
                        Text(
                          "more",
                          style: AppTextStyles.normal.copyWith(
                              fontSize: Get.height * 0.05,
                              color: kPrimaryColor),
                        ),
                        10.verticalSpace,
                        Text(
                          "If you are looking for FAQs, information about this app or more, you're in the right spot. Simply swipe to see the options.",
                          style: AppTextStyles.normal.copyWith(
                              fontSize: Get.height * 0.016,
                              color: kPrimaryColor,
                              fontFamily: kSecondaryFontFamily),
                        ),
                        20.verticalSpace,
                        announcementSlider(),
                        sliderIndicators(),
                        30.verticalSpace,
                         CustomIconButton(
                          text: "CALL ANTHONY & SYLVAN",
                          imagePath: Assets.phoneImageIcon,
                          onTap: (){
                            controller.openUrl('tel:${8777297946}');
                          },
                        ),
                        20.verticalSpace,
                        CustomIconButton(
                          text: "EMAIL ANTHONY & SYLVAN",
                          imagePath: Assets.msgImageIcon,
                          onTap: (){
                            controller.openUrl('mailto:splashcash@anthonysylvan.com');
                          },
                        ),
                        20.verticalSpace,
                        CustomIconButton(
                          text: "VISIT OUR WEBSITE",
                          onTap: (){
                            controller.openUrl('https://anthonysylvan.com/');
                          },
                        ),
                        20.verticalSpace,
                      ]),
                ),
              ),
            ]),
      )),
    );
  }

  Widget announcementSlider() {
    List<CustomMiniBoxes> customMiniBoxesList = [];
    for (var data in controller.dataList) {
      customMiniBoxesList.add(
        CustomMiniBoxes(
          about: data['about'],
          imagePath: data['path'],
          onTap: data['onTap'],
        ),
      );
    }
    return Container(
      height: Get.height * 0.17,
      width: Get.width,
      margin: const EdgeInsets.only(top: 20),
      child: CarouselSlider(
        items: customMiniBoxesList,
        options: CarouselOptions(
          viewportFraction: 0.30,
          onPageChanged: (index, reason) {
              controller.currentSliderIndex.value = index;

          },
          autoPlay: true,
        ),
      ),
    );
  }

  Widget sliderIndicators() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.center,
        child: Obx(()=> DotsIndicator(
            dotsCount: 5,
            position: controller.currentSliderIndex.value,
            decorator: DotsDecorator(
                activeColor: kGreyColor.withOpacity(0.7),
                color: kGreyColor.withOpacity(0.3)),
          ),
        ),
      ),
    );
  }
}
