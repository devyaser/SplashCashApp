import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/assets.dart';
import '../../route_management/app_routes.dart';

class AlwaysMoreScreenController extends GetxController{
  RxInt currentSliderIndex = 0.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Map<String, dynamic>> dataList = [
    {
      "path": Assets.faqsImageIcon,
      "about": "FAQs",
      "onTap": () {
        Get.toNamed(Routes.faqScreen);
      }
    },
    {
      "path": Assets.aboutAppImageIcon,
      "about": "About this app",
      "onTap": () {
        Get.toNamed(Routes.aboutAppScreen);
      }
    },
    {
      "path": Assets.termsAndPolicyImageIcon,
      "about": "Terms & condition",
      "onTap": () {
        Get.toNamed(Routes.termsAndCondition);
      }
    },
    {
      "path": Assets.privacyPolicyImageIcon,
      "about": "Privacy policy",
      "onTap": () {
        Get.toNamed(Routes.privacyPolicy);
      }
    },
    {
      "path": Assets.LicenseImageIcon,
      "about": "License information",
      "onTap": () {
        Get.toNamed(Routes.licenseInformation);
      }
    }
  ];

  Future<void> openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}