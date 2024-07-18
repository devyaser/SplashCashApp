import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/constants/assets.dart';
import 'package:splashcashapp/global/constants/colors.dart';
import 'package:splashcashapp/global/customs/classes/cunstom_mini_boxes.dart';
import 'package:splashcashapp/global/customs/classes/custom_drawer.dart';
import 'package:splashcashapp/global/customs/classes/cutom_button.dart';
import 'package:splashcashapp/global/customs/dashboard_announcement_card.dart';
import 'package:splashcashapp/global/customs/text_styles.dart';
import 'package:splashcashapp/global/customs/utils.dart';
import 'package:splashcashapp/global/modules/controllers/dashboard_screen_controller.dart';

import '../../constants/constants.dart';


class DashboardScreen extends GetView<DashboardScreenController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      drawer:Padding(
        padding: EdgeInsets.only(top: Get.height * 0.142),
        child:  Obx(()=> CustomDrawer(
            description: controller.notificationContent.value,
          ),
        ),
      ),
      drawerEnableOpenDragGesture: false,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: Get.height * 0.04),
              height: Get.height,
              width: Get.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.dashboardBackgroundImage),
                  fit: BoxFit.fill,
                ),
              )),
          Column(
            children: [
              Container(
                  color: kWhiteColor,
                  height: Get.height * 0.06),
              Container(
                height: Get.height * 0.04,
                decoration:  const BoxDecoration(
                  color: kWhiteColor,
                  image: DecorationImage(
                    image: AssetImage(Assets.appBarLogo),
                  ),
                ),
              ),
              Container(
                  color: kWhiteColor, height: 10),
              MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Get.height * 0.22),
                      Obx(()=> controller.referralNotificationModelList.isNotEmpty?Row(
                        children: [
                          Text("Good News!", style: AppTextStyles.large),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                controller.markAsRead(notification: controller.referralNotificationModelList.first);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kSecondaryColor,
                                  borderRadius: BorderRadius.circular(8),

                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                child: Row(
                                  children: [
                                    Image.asset(Assets.closeIcon,height: 21,width: 17,),
                                    const SizedBox(width: 8,),
                                    Expanded(child: Text('Mark as Read',style: AppTextStyles.bold.copyWith(fontSize: Get.height * 0.012, color: kPrimaryColor, fontFamily: kSecondaryFontFamily,fontWeight: FontWeight.w700)))
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ):Text("A win-win!", style: AppTextStyles.large)),
                      Obx(()=> controller.referralNotificationModelList.isNotEmpty?RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                              "You are one step closer to Splash Cash Rewards. ",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: Get.height * 0.014,
                                  color: const Color.fromRGBO(12, 39, 70, 1.000)),
                            ),
                            TextSpan(
                                text: "${controller.referralNotificationModelList.first.referralFirstName} ",
                                style: AppTextStyles.semiBold.copyWith(
                                  color: kPrimaryColor,
                                  fontFamily: "Poppins",
                                  fontSize: Get.height * 0.016,
                                )),
                            TextSpan(
                              text:
                              "has made an appointment to meet with a Design Consultant. Thank you for spreading the word about Anthony & Sylvan.",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: Get.height * 0.014,
                                  color: const Color.fromRGBO(12, 39, 70, 1.000)),
                            ),
                          ],
                        ),
                      ):Obx(()=> RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: controller.userLoginModel.value.firstName==""?"Welcome. ":"${controller.userLoginModel.value.firstName}. ",
                                    style: AppTextStyles.semiBold.copyWith(
                                      color: kPrimaryColor,
                                      fontFamily: "Poppins",
                                      fontSize: Get.height * 0.016,
                                    )),
                                TextSpan(
                                  text:
                                  "You can get rewarded for spreading the word about Anthony & Sylvan Pools, and your friends benefit from how a great pool changes everything.",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: Get.height * 0.014,
                                      color: const Color.fromRGBO(12, 39, 70, 1.000)),
                                ),
                              ],
                            ),
                          ),
                      ),
                      ),
                      announcementSlider(),
                     Obx(() => Utils.sliderIndicators(controller.currentSliderIndex.value,3)),
                      screensSlider(),
                      Obx(() => Utils.sliderIndicators(controller.currentScreenSliderIndex.value,controller.dataList.length)),
                    ],
                  ),
                ),
              )

            ],
          ),
        ],
      ),

    );
  }

  Widget announcementSlider() {
    return Container(
      height: Get.height * 0.17,
      width: Get.width,
      margin: const EdgeInsets.only(top: 20),
      child: CarouselSlider(
        items: [
          dashboardAnnouncementCard(
            title: "HOW IT WORKS:",
            description:
            "You tell folks how much you love your pool. They sign up for a FREE consultation. If they build or renovate a pool with us, you get rewarded!",
            desFontSize: Get.height * 0.014,
          ),
          dashboardAnnouncementCard(
              heading: "You can earn",
              title: "\$1,000",
              titleFontSize: Get.height * 0.045,
              desFontSize: Get.height * 0.015,
              description:
              "for every new pool referral who builds a pool with us"),
          dashboardAnnouncementCard(
              heading: "You can earn",
              title: "\$500",
              titleFontSize: Get.height * 0.045,
              color: kSecondaryColor,
              desFontSize: Get.height * 0.015,
              description:
              "for every referral who renovates their pool with us"),
        ],
        options: CarouselOptions(
          viewportFraction: 0.75,
          onPageChanged: (index, reason) {
            controller.currentSliderIndex.value = index;
          },
          autoPlay: true,
        ),
      ),
    );
  }
  Widget screensSlider() {

    List<CustomMiniBoxes> customMiniBoxesList = [];
    for(var data in controller.dataList.value){
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