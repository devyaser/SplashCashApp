/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/customs/classes/custom_scaffold.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../constants/assets.dart';
import '../../constants/colors.dart';
import '../../modules/controllers/custom_webview_controller.dart';
import '../utils.dart';

class CustomWebViewWidget extends GetView<CustomWebViewController>{
  const CustomWebViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Scaffold(
        body: Column(
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
            Expanded(
              child: WebViewWidget(
                controller: controller.webViewController,
              ),
            ),
          ],
        ), key: controller.scaffoldKey,
      ),
    );
  }

}*/