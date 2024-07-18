import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:splashcashapp/global/constants/colors.dart';
import 'package:splashcashapp/global/customs/text_styles.dart';
import 'package:splashcashapp/global/customs/widget_spacing.dart';
import 'package:splashcashapp/global/modules/controllers/splash_screen_controller.dart';
import '../../constants/assets.dart';


class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: Center(
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(controller.image))
              ),
              child: Column(
                children: [
                  SizedBox(height: Get.height * 0.2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: Image.asset(Assets.splashText),
                  ),
                  SizedBox(height: Get.height * 0.1),

                  Shimmer.fromColors(
                    baseColor: kPrimaryColor,
                    highlightColor: Colors.grey,
                    child: Container(
                      height: Get.height * 0.08,
                      width:  Get.height * 0.08,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.red,width: 5.2)
                      ),

                    ),
                  ),
                  10.verticalSpace,
                  Shimmer.fromColors(
                    baseColor: kPrimaryColor,
                    highlightColor: Colors.grey,
                    child: Text("LOADING...",style: AppTextStyles.medium.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize:Get.width * 0.03,
                    )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}