import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:splashcashapp/global/constants/constants.dart';
import 'package:splashcashapp/global/customs/widget_spacing.dart';

import '../../constants/colors.dart';
import '../text_styles.dart';

class CustomIconButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final String? text;
  final String? imagePath;
  final VoidCallback? onTap;

  const CustomIconButton({super.key, this.color, this.textColor, this.text, this.onTap, this.imagePath,});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 0,
      padding: EdgeInsets.zero,
      onPressed:onTap,

      child: Container(
        height: Get.height * 0.045,
        width: Get.width ,
        decoration: tabDecoration(color ?? kSecondaryColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("$text",style: AppTextStyles.semiBold.copyWith(
                  color: textColor ?? kPrimaryColor,
                  fontSize:  Get.height * 0.017,
                  fontFamily: kSecondaryFontFamily
              )),
              Spacer(),
            imagePath==null? 0.verticalSpace :
            Image.asset(imagePath!,),
            ],
          ),
        ),
      ),
    );
  }
  BoxDecoration tabDecoration(Color color) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(5)));
  }
}
