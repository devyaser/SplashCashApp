import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/customs/widget_spacing.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../customs/classes/custom_scaffold.dart';
import '../../customs/text_styles.dart';

class LicenseInformationScreen extends StatelessWidget {
   LicenseInformationScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return  MediaQuery(
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

                          Text("License", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.05, color: kPrimaryColor),),
                          Text("information", style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.05, color: kPrimaryColor),),
                          30.verticalSpace,
                          RichText(
                text: TextSpan(
                  text: 'The entities doing business as Anthony & Sylvan Pools include Anthony & Sylvan Pools Corporation, Anthony & Sylvan Corp. and Anthony & Sylvan Pools North Carolina LLC. Anthony & Sylvan’s statewide licenses/registrations: #SPB.0000089 and HIC.0501976(CT); #2006201521(DE); #410512000233(DC); CPC1459629 and CPC1459777(FL); #203008(MA); 05-129792 - Reg#95872(MD); #13VH01546700(NJ); #H-20201 and #WC22294H09(NY); #0023414(NV); #68766(NC); #006381(PA); GC-46619(RI); G122698(SC): #75966(TN); #2701011419(VA RFC/ELE); and #WV030223(WV). ',
                  style: AppTextStyles.normal.copyWith(fontSize: Get.height * 0.016, color: kPrimaryColor, fontFamily: kSecondaryFontFamily, height: 2.0),
                  children: [
                    TextSpan(
                      text: 'FOR INFORMATION ABOUT CONTRACTORS AND THE NEW JERSEY CONTRACTORS’ REGISTRATION ACT, CONTACT THE NEW JERSEY DEPARTMENT OF LAW AND PUBLIC SAFETY, DIVISION OF CONSUMER AFFAIRS AT 1.888.656.6225.',
                      style: AppTextStyles.bold.copyWith(fontSize: Get.height * 0.016, color: kPrimaryColor, fontFamily: kSecondaryFontFamily,height: 2.0),
                    ),
                  ],
                ),
              ),
                        ]),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
