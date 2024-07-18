
import 'package:get/get.dart';
import 'package:splashcashapp/global/modules/controllers/always_more_screen_controller.dart';
import 'package:splashcashapp/global/modules/controllers/auth_screen_cotnroller.dart';
import 'package:splashcashapp/global/modules/controllers/change_password_screen_controller.dart';
import 'package:splashcashapp/global/modules/controllers/create_referral_screen_controller.dart';
import 'package:splashcashapp/global/modules/controllers/custom_webview_controller.dart';
import 'package:splashcashapp/global/modules/controllers/dashboard_screen_controller.dart';
import 'package:splashcashapp/global/modules/controllers/faq_screen_controller.dart';
import 'package:splashcashapp/global/modules/controllers/forget_password_screen_controller.dart';
import 'package:splashcashapp/global/modules/controllers/login_screen_cotnroller.dart';
import 'package:splashcashapp/global/modules/controllers/make_referral_screen_controller.dart';
import 'package:splashcashapp/global/modules/controllers/reset_password_screen_controller.dart';
import 'package:splashcashapp/global/modules/controllers/signup_screen_controller.dart';
import 'package:splashcashapp/global/modules/controllers/splash_screen_controller.dart';
import 'package:splashcashapp/global/modules/controllers/track_referral_screen_controller.dart';
import 'package:splashcashapp/global/modules/views/signup_screen.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthScreenController());
    Get.lazyPut(() => LoginScreenController());
    Get.lazyPut(() => SignupScreenController());
    Get.lazyPut(() => DashboardScreenController());
    Get.lazyPut(() => ChangePasswordScreenController());
    Get.lazyPut(() => ForgetPasswordScreenController());
    Get.lazyPut(() => MakeReferralScreenController());
    Get.lazyPut(() => TrackReferralScreenController());
    Get.lazyPut(() => FAQScreenController());
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => ResetPasswordScreenController());
   // Get.lazyPut(() => CustomWebViewController());
    Get.lazyPut(() => CreateReferralScreenController());
    Get.lazyPut(() => AlwaysMoreScreenController());
    // Get.lazyPut(() => LoginScreenController());
    // Get.lazyPut(() => RegistrationScreenController());

  }
}