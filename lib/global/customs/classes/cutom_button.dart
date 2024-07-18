import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/constants/colors.dart';
import 'package:splashcashapp/global/constants/constants.dart';


import 'package:splashcashapp/global/customs/text_styles.dart';

class CustomButton extends StatelessWidget {

  final Color? color;
  final Color? textColor;
  final String? text;
  final VoidCallback? onTap;

  const CustomButton({
    this.color,
    this.textColor,
    this.text,
    this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  CupertinoButton(
      minSize: 0,
      padding: EdgeInsets.zero,
      onPressed:onTap,

      child: Container(
        height: Get.height * 0.045,
        width: Get.width * 0.4,
        decoration: tabDecoration(color ?? kSecondaryColor),
        child: Center(
          child: Text("$text",style: AppTextStyles.semiBold.copyWith(
              color: textColor ?? kPrimaryColor,
              fontSize:  Get.height * 0.016,
              fontFamily: kSecondaryFontFamily,
              letterSpacing: 1
          )),
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