import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/customs/widget_spacing.dart';

import '../../constants/colors.dart';
import 'cutom_button.dart';

class CustomLinkWidget extends StatelessWidget{
  final String? link;
  final VoidCallback? onTap;
   const CustomLinkWidget({super.key,this.link='',required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      width: Get.width,
      padding: const EdgeInsets.only(top: 13, bottom: 9, right: 10, left: 10,
      ),
      child: Column(
        children: [
          10.verticalSpace,
          Text(
            "YOUR UNIQUE SHARE LINK:",
            style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                fontSize:Get.height * 0.018,
                color: Colors.white),
            textAlign: TextAlign.center,
          ),
          15.verticalSpace,
          Text(
            "Copy paste and send",
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: Get.height * 0.017,
                color:kTextFieldHintColor),
            textAlign: TextAlign.center,
          ),

          Text(
            link??'',
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: Get.height * 0.017,
                color: kTextFieldHintColor),
            textAlign: TextAlign.center,
          ),
          20.verticalSpace,
          CustomButton(
            text: "COPY LINK",
            onTap: onTap,
          ),
          10.verticalSpace,
        ],
      ),
    );
  }

}