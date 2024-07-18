import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/customs/widget_spacing.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../customs/classes/custom_scaffold.dart';
import '../../customs/text_styles.dart';

class PrivacyPolicyScreen extends StatelessWidget {
   PrivacyPolicyScreen({super.key});
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
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text("Privacy policy", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.05, color: kPrimaryColor),),
                            30.verticalSpace,
                            Text("Anthony & Sylvan recognizes that you may be concerned about our use and disclosure of your personal information. Your privacy is important to us, and the following will inform you of the information that we may collect from you, and how it is used. By using our Splash Cash app you are accepting our terms and the practices described in this policy.", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.016, color: kPrimaryColor, fontFamily: kSecondaryFontFamily, height: 2),),
                            20.verticalSpace,
                            Text("Information We May Collect And Use Thereof", style: AppTextStyles.bold.copyWith(fontSize: Get.height * 0.016, color: kPrimaryColor, fontFamily: kSecondaryFontFamily),),
                            Text("If you communicate with us regarding our Website or our products or services, we will collect any information that you provide to us. We may also request and store personal information from you, such as name, home address, phone numbers and e-mail addresses; as well as the type of information, goods or services you are interested in receiving; and whether, and at what time, you might wish a consultation. Additionally, we may collect non-personal information, such as a domain name and IP Address. The domain name and IP address reveals nothing personal about you other than the IP address from which you have accessed our site. We may also collect information about the type of Internet browser you are using, operating system, what brought you to our Website, as well as which of our Web pages you have accessed.", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.016, color: kPrimaryColor, fontFamily: kSecondaryFontFamily, height: 2),),
                            20.verticalSpace,
                            Text("Anthony & Sylvan uses web-tracking software to analyze traffic to this website in order to understand our customers’ and visitors’ needs and to continually improve our site for them. This web-tracking software collects only anonymous, aggregate statistics.  You may opt out of any future contacts from us or request deletion of any data we have about you at any time by sending a request to customerservice@anthonysylvan.com", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.016, color: kPrimaryColor, fontFamily: kSecondaryFontFamily, height: 2),),
                            20.verticalSpace,
                            Text("Unless you ask us not to, we may contact you via email in the future to tell you about specials, new products or services, or changes to this privacy policy.  We may use your information to improve our products and services, to conduct research and analysis, and to perform other business activities as needed.  We may also disclose information we collect to comply with the law; to enforce or apply applicable terms and conditions and other agreements; to facilitate the financing, securitization, insuring, sale, assignment, bankruptcy, or disposal of all or part of our business or assets; or to protect the rights property or safety of our company, our guests or others.", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.016, color: kPrimaryColor, fontFamily: kSecondaryFontFamily, height: 2),),

                          ]),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
