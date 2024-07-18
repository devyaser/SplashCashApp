import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/customs/widget_spacing.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/assets.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../customs/classes/custom_icon_button.dart';
import '../../customs/classes/custom_scaffold.dart';
import '../../customs/text_styles.dart';

class ContactUsScreen extends StatelessWidget{
   ContactUsScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: CustomScaffold(
          scaffoldKey: scaffoldKey,
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
                              "Contact Us",
                              style: AppTextStyles.normal.copyWith(
                                  fontSize: Get.height * 0.05,
                                  color: kPrimaryColor),
                            ),
                            10.verticalSpace,
                            Text(
                              "If you have any query, you can contact us:",
                              style: AppTextStyles.normal.copyWith(
                                  fontSize: Get.height * 0.016,
                                  color: kPrimaryColor,
                                  fontFamily: kSecondaryFontFamily),
                            ),
                            20.verticalSpace,
                            CustomIconButton(
                              text: "CALL ANTHONY & SYLVAN",
                              imagePath: Assets.phoneImageIcon,
                              onTap: (){
                                openUrl('tel:${8777297946}');
                              },
                            ),
                            20.verticalSpace,
                            CustomIconButton(
                              text: "EMAIL ANTHONY & SYLVAN",
                              imagePath: Assets.msgImageIcon,
                              onTap: (){
                                openUrl('mailto:splashcash@anthonysylvan.com');
                              },
                            ),
                            20.verticalSpace,
                            CustomIconButton(
                              text: "VISIT OUR WEBSITE",
                              onTap: (){
                                openUrl('https://anthonysylvan.com/');
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

  Future<void> openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}