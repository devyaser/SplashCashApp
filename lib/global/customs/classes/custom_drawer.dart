import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/constants/colors.dart';
import 'package:splashcashapp/global/constants/constants.dart';
import 'package:splashcashapp/global/customs/text_styles.dart';
import 'package:splashcashapp/global/customs/utils.dart';
import 'package:splashcashapp/global/customs/widget_spacing.dart';

class CustomDrawer extends StatelessWidget {

  final String? title;
  final String? description;
  const CustomDrawer({
    this.title,
    this.description,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Drawer(
        backgroundColor: Colors.transparent,
        child: GestureDetector(
          onHorizontalDragEnd: (v) {
            // do nothing
          },
          child: Row(
            children: [
              Container(
                /// replace by your desired width
                width: MediaQuery.of(context).size.width/1.1,
                color: kDrawerColor.withOpacity(0.67),
                child: Center(child: drawerContent()),
              ),
              Expanded(child: Container(color: Colors.transparent)),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerContent(){
    return Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //SizedBox(height: Get.height * 0.084,),
            Utils.backButton(color: kSecondaryColor,arrowColor:kPrimaryColor),
            SizedBox(height: Get.height * 0.05),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
                children: [
                 title == null ? 0.verticalSpace: Padding(
                   padding: const EdgeInsets.only(bottom: 20),
                   child: Text("$title",style: AppTextStyles.semiBold.copyWith(
                      color: kPrimaryColor,
                      fontFamily: kSecondaryFontFamily
                    )),
                 ),

                  Text("$description",style: AppTextStyles.normal.copyWith(
                      color: kPrimaryColor,
                      fontFamily: kSecondaryFontFamily,
                    fontSize: Get.height * 0.015
                  ),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
