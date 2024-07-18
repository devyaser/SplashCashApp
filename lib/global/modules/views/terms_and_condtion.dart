import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/customs/widget_spacing.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../customs/classes/custom_scaffold.dart';
import '../../customs/text_styles.dart';

class TermsAndConditionScreen extends StatelessWidget {
   TermsAndConditionScreen({super.key});
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
                          Text("Terms &", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.05, color: kPrimaryColor),),
                          Text("conditions", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.05, color: kPrimaryColor),),
                          30.verticalSpace,
                          Text("*Person referred cannot be on current prospect list. There is no limit the number of people referred. For contracts signed after August 15, 2022, you will receive a \$1,000 reward after completion of excavation of the pool or \$500 reward after renovation completion for the person you referred. For referrals signing contracts up to and including August 15, 2022, the reward for a new pool referral is \$500 and \$250 for a renovation referral. Splash Cash Members must complete and submit a W-9 form in order to receive reward payment. W-9 form links will be sent to Members when their referral's new pool is excavated or renovation is completed. Minimum \$10K contract, not valid on existing contracts, can’t be combined with other offers. Limit one per customer referred. Other terms and conditions may apply.", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.016, color: kPrimaryColor, fontFamily: kSecondaryFontFamily, height: 2),),
                        ]),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
