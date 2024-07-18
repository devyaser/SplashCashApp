import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/modules/model/faq_model.dart';
import 'package:splashcashapp/global/web_services/faq_service.dart';

class FAQScreenController extends GetxController  {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxList<AboutModel> aboutList = <AboutModel>[].obs;

  RxList<TrackingReferralModel> trackingReferralList = <TrackingReferralModel>[].obs;
  FAQModel faqModel=FAQModel.empty();
  FAQServices faqServices=FAQServices();

  @override
  void onInit() {
    getFaqDetail();
    super.onInit();
  }

  Future<void> getFaqDetail() async{
    faqModel=await faqServices.getFAQModel();
    aboutList.value=faqModel.listOfAboutModel;
    trackingReferralList.value=faqModel.listOfTrackingReferralsModel;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
