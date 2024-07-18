import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:splashcashapp/global/constants/assets.dart';
import 'package:splashcashapp/global/constants/colors.dart';
import 'package:splashcashapp/global/customs/utils.dart';
import 'custom_drawer.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? body;
  final String? notificationTitle;
  final String? notificationDesc;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const CustomScaffold({super.key, this.body,this.notificationTitle,this.notificationDesc,required this.scaffoldKey,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
     // color: kBackgroundColor,
      child: Scaffold(
         // resizeToAvoidBottomInset: false,
        key: scaffoldKey,
         backgroundColor: kBackgroundColor,
        body:Column(
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
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                const EdgeInsets.only(top: 20.0, bottom: 10.0,left: 20),
                child: Utils.backButton(),
              ),
            ),
            Expanded(child: SingleChildScrollView(child: body ?? Container())),
          ],
        ),
        drawer: notificationDesc!=''?Padding(
          padding: EdgeInsets.only(top: Get.height * 0.118),
          child:  CustomDrawer(
            title: notificationTitle??'',
            description: notificationDesc,
          ),
        ):null,
        drawerEnableOpenDragGesture: false,

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
}
