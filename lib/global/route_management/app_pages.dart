

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:splashcashapp/global/customs/classes/custom_webview.dart';
import 'package:splashcashapp/global/modules/views/about_app.dart';
import 'package:splashcashapp/global/modules/views/auth_screen.dart';
import 'package:splashcashapp/global/modules/views/change_password_screen.dart';
import 'package:splashcashapp/global/modules/views/check_your_email_sceren.dart';
import 'package:splashcashapp/global/modules/views/contact_us_screen.dart';
import 'package:splashcashapp/global/modules/views/create_referral_screen.dart';
import 'package:splashcashapp/global/modules/views/dashboard.dart';
import 'package:splashcashapp/global/modules/views/forget_password_screen.dart';
import 'package:splashcashapp/global/modules/views/license_information.dart';
import 'package:splashcashapp/global/modules/views/make_referral_screen.dart';
import 'package:splashcashapp/global/modules/views/privacy_policy_screen.dart';
import 'package:splashcashapp/global/modules/views/reset_password_screen.dart';
import 'package:splashcashapp/global/modules/views/terms_and_condtion.dart';
import 'package:splashcashapp/global/modules/views/login_screen.dart';
import 'package:splashcashapp/global/modules/views/signup_screen.dart';
import 'package:splashcashapp/global/modules/views/track_referral_screen.dart';
import 'package:splashcashapp/global/route_management/initial_bindings.dart';

import '../constants/constants.dart';
import '../modules/views/always_more_screen.dart';
import '../modules/views/faq_screen.dart';
import '../modules/views/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;
  //
  static List<GetPage> getPages() {
    return [
      GetPage(
          name: Routes.splash,
          page: () => const SplashScreen(),
          binding: InitialBindings(),
          transition: routeTransition),
      GetPage(
          name: Routes.authentication,
          page: () => const AuthScreen(),
          binding: InitialBindings(),
          transition: routeTransition),
      GetPage(
          name: Routes.alwaysMore,
          page: () => const AlwaysMoreScreen(),
          binding: InitialBindings(),
          transition: routeTransition),
      GetPage(
          name: Routes.faqScreen,
          page: () =>  const FAQsScreen(),
          binding: InitialBindings(),
          transition: routeTransition),
      GetPage(
          name: Routes.termsAndCondition,
          page: () =>  TermsAndConditionScreen(),
          binding: InitialBindings(),
          transition: routeTransition),
      GetPage(
          name: Routes.privacyPolicy,
          page: () =>  PrivacyPolicyScreen(),
          binding: InitialBindings(),
          transition: routeTransition),
      GetPage(
          name: Routes.licenseInformation,
          page: () =>  LicenseInformationScreen(),
          binding: InitialBindings(),
          transition: routeTransition),
      GetPage(
          name: Routes.aboutAppScreen,
          page: () =>  AboutAppScreen(),
          binding: InitialBindings(),
          transition: routeTransition),
      GetPage(
          name: Routes.login,
          page: () => const LoginScreen(),
          binding: InitialBindings(),
          transition: routeTransition),

      GetPage(
          name: Routes.signup,
          page: () => const SignupScreen(),
          binding: InitialBindings(),
          transition: routeTransition),
      GetPage(
          name: Routes.dashboard,
          page: () => const DashboardScreen(),
          binding: InitialBindings(),
          transition: routeTransition),

  GetPage(
          name: Routes.changePassword,
          page: () => const ChangePasswordScreen(),
          binding: InitialBindings(),
          transition: routeTransition),
 GetPage(
          name: Routes.forgetPassword,
          page: () => const ForgetPasswordScreen(),
          binding: InitialBindings(),
          transition: routeTransition),

 GetPage(
          name: Routes.checkEmail,
          page: () => CheckYourEmailScreen(),
          transition: routeTransition),

      GetPage(
          name: Routes.makeReferralScreen,
          page: () => const MakeReferralScreen(),
          binding: InitialBindings(),
          transition: routeTransition),
      GetPage(
          name: Routes.trackReferralScreen,
          page: () => const TrackReferralScreen(),
          binding: InitialBindings(),
          transition: routeTransition),
      GetPage(
          name: Routes.resetPasswordScreen,
          page: () => const ResetPasswordScreen(),
          binding: InitialBindings(),
          transition: routeTransition),
      /*GetPage(
          name: Routes.customWebView,
          page: () => const CustomWebViewWidget(),
          binding: InitialBindings(),
          transition: routeTransition),*/
      GetPage(
          name: Routes.createReferralScreen,
          page: () => const CreateReferralScreen(),
          binding: InitialBindings(),
          transition: routeTransition),
      GetPage(
          name: Routes.contactUsScreen,
          page: () => ContactUsScreen(),
          transition: routeTransition),



     ];
   }
}