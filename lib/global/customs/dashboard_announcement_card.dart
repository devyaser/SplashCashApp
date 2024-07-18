import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/constants/colors.dart';
import 'package:splashcashapp/global/customs/widget_spacing.dart';

Widget dashboardAnnouncementCard({heading,title,description,color,titleFontSize,desFontSize}){
  return  SizedBox(
    width: Get.width * 0.6,

    child: Center(
      child: Container(
        color: color ?? kPrimaryColor,
        padding: const EdgeInsets.only(
          top: 13,
          bottom: 9,
          right: 10,
          left: 10,
        ),
        child:  Column(children: [
          heading == null ? 0.verticalSpace :
          Text(
            "$heading",
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: Get.height * 0.017,
                color: Colors.white),
            textAlign: TextAlign.center,
          ),

          Text(
            "$title",
            style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                fontSize:titleFontSize ?? Get.height * 0.018,
                color: Colors.white),
            textAlign: TextAlign.center,
          ),

          Expanded(
            child: Text(
              "$description",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: desFontSize ?? Get.height * 0.017,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          )
        ]),
      ),
    ),
  );
}