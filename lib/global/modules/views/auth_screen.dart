import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/customs/widget_spacing.dart';
import 'package:splashcashapp/global/modules/controllers/auth_screen_cotnroller.dart';
import 'package:splashcashapp/global/modules/views/login_screen.dart';
import 'package:splashcashapp/global/modules/views/signup_screen.dart';

import '../../constants/colors.dart';

class AuthScreen extends GetView<AuthScreenController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Container(
          height: Get.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              tileMode: TileMode.repeated,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [kSecondaryColor,kSecondaryColor, kPrimaryColor, kPrimaryColor],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: Get.height * 0.35,
                color: kSecondaryColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: Get.height * 0.08),
                    Container(
                      height: Get.height * 0.19,
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: kSecondaryColor,
                          image: DecorationImage(
                            image:
                            AssetImage("assets/ASPSplashCash_White_Logo.png"),
                          )),
                    ),
                    const Spacer(),
                    customTabBar(),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  color: kPrimaryColor,
                  child: TabBarView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      controller: controller.tabController,
                      children: const [
                        LoginScreen(),
                        SignupScreen(),
                      ]),
                ),
              ),



              // Container(
              //   color: Colors.red,
              //   height: Get.height * 0.65,
              //   width: Get.width,
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //       Container(
              //         height: Get.height * 0.65,
              //         child: TabBarView(
              //           physics: AlwaysScrollableScrollPhysics(),
              //                   controller: controller.tabController,
              //                   children: const [
              //                     LoginScreen(),
              //                     SignupScreen(),
              //                   ]),
              //       ),
              //       ],
              //     ),
              //   ),
              // ),

              // SizedBox(
              //     height: Get.height * 0.65,
              //     width: MediaQuery.of(context).size.width,
              //     child: Container(
              //       color: kPrimaryColor,
              //       height: Get.height,
              //       child: TabBarView(
              //           controller: controller.tabController,
              //           children: const [
              //             LoginScreen(),
              //             SignupScreen(),
              //           ]),
              //     )),
            ],
          ),
        ),

      ),
    );
  }


  BoxDecoration customDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 10,
          offset: const Offset(-5, 0), // Shadow to the left
        ),
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 10,
          offset: const Offset(5, 0), // Shadow to the right
        ),
      ],
    );
  }

  Widget customTabBar() {
    controller.tabController.addListener(() {
      controller.tabController.index == 0
          ? controller.onTapChange2(true)
          : controller.onTapChange2(false);
    });
    return Obx(
          () => Container(
        alignment: Alignment.bottomCenter,
        color: kSecondaryColor,
        child: TabBar(
          unselectedLabelColor: kGreyColor,
          // Set the color for deselected tabs
          labelColor: Colors.white,
          controller: controller.tabController,
          indicatorPadding: EdgeInsets.zero,
          padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
          labelPadding: EdgeInsets.zero,
          indicatorWeight: 0.01,
          indicator: null,

          tabs: [
            Container(
              decoration: tabDecoration(controller.isLoginTapped.value
                  ? kPrimaryColor
                  : kSecondaryColor),
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        width: Get.width * 0.4,
                        height: Get.height * 0.035,
                        decoration: tabDecoration(controller.isLoginTapped.value
                            ? kPrimaryColor
                            : kWhiteColor),
                        child: const Tab(
                            text:
                            "LOGIN"), // Replace "${controller.isLoginTapped.value}" with "Login"
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: tabDecoration(controller.isLoginTapped.value
                  ? kSecondaryColor
                  : kPrimaryColor),
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        height: Get.height * 0.035,
                        width: Get.width * 0.4,
                        decoration: tabDecoration(controller.isLoginTapped.value
                            ? kWhiteColor
                            : kPrimaryColor),
                        child: const Tab(
                            text:
                            "SIGN UP"), // Replace "${controller.isLoginTapped.value}" with "Sign Up"
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Widget customTabBar2() {
  //   return Obx(() => Container(
  //
  //     color: kSecondaryColor,
  //     child: TabBar(
  //
  //       unselectedLabelColor:controller.isLoginTapped.value  ?kGreyColor :Colors.white,
  //       // Set the color for deselected tabs
  //       labelColor: controller.isLoginTapped.value ?Colors.white:kGreyColor,
  //       controller: controller.tabController,
  //       indicatorPadding: EdgeInsets.zero,
  //      padding: const EdgeInsets.only(left: 40,right: 40,top: 10),
  //       labelPadding: EdgeInsets.zero,
  //       indicatorWeight: 0.01,
  //       indicator: null,
  //       tabs: [
  //         GestureDetector(
  //           onTap: () => controller.onTapChange2(true),
  //           child: Container(
  //             width: Get.width * 0.4,
  //             height: controller.isLoginTapped.value? Get.height * 0.04:Get.height *0.03,
  //             decoration: tabDecoraion(controller.isLoginTapped.value ? kPrimaryColor:kWhiteColor),
  //
  //             child: const Tab(text: "Login"), // Replace "${controller.isLoginTapped.value}" with "Login"
  //           ),
  //         ),
  //         GestureDetector(
  //           onTap: () {
  //             controller.onTapChange2(false);
  //           },
  //           child: Container(
  //
  //             height: controller.isLoginTapped.value? Get.height * 0.03:Get.height *0.04,
  //             width: Get.width * 0.4,
  //             decoration: tabDecoraion(controller.isLoginTapped.value ? kWhiteColor : kPrimaryColor),
  //             child: const Tab(text: "Sign Up"), // Replace "${controller.isLoginTapped.value}" with "Sign Up"
  //           ),
  //         ),
  //       ],
  //     ),
  //   ),
  //   );
  // }

// Widget customTabBar() {
  //   return Container(
  //     color: kSecondaryColor,
  //     child: TabBar(
  //       controller: controller.tabController,
  //         indicatorPadding: EdgeInsets.zero,
  //         indicatorSize:TabBarIndicatorSize.values[0],
  //         indicatorColor: Colors.transparent,
  //         unselectedLabelColor: Color.fromRGBO(141, 147, 156, 1.000),
  //         tabs: [
  //           Container(
  //               width: Get.width * 0.4,
  //               color:Colors.red,
  //               child: Tab(text: "Login")),
  //           Container(
  //               width: Get.width * 0.4,
  //               color: Colors.green,
  //               child: Tab(text: "Sign Up")),
  //         ]),
  //   );
  // }

  BoxDecoration tabDecoration(Color color) {
    return BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(5),
          topLeft: Radius.circular(5),
        ));
  }
}