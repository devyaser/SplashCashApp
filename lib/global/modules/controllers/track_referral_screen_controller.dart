import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashcashapp/global/modules/model/member_referral_model.dart';

import '../../constants/assets.dart';
import '../../customs/user_session_management.dart';
import '../../web_services/referral_services.dart';
import '../model/user_login_model.dart';

class TrackReferralScreenController extends GetxController{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  RxInt currentSliderIndex = 0.obs;
  RxInt currentScreenPendingSliderIndex = 0.obs;
  RxInt currentScreenQualifiedSliderIndex = 0.obs;
  RxInt currentScreenApprovedSliderIndex = 0.obs;

  Rx<MemberReferralModel> memberReferralModel=MemberReferralModel.empty().obs;
  ReferralServices referralServices=ReferralServices();

  UserSession userSession=UserSession();
  Rx<UserLoginModel> userLoginModel=UserLoginModel.empty().obs;
  RxList<PendingReferrals> pendingReferral =<PendingReferrals>[].obs;
  RxList<QualifiedReferrals> qualifiedReferral =<QualifiedReferrals>[].obs;
  RxList<ApprovedReferrals> approvedReferral =<ApprovedReferrals>[].obs;

  @override
  void onInit() {
    getReferralMember();
    super.onInit();
  }

  Future<void> getReferralMember() async{
    userLoginModel.value=await userSession.getUserLoginModel();
    memberReferralModel.value=await referralServices.getMemberReferralModel(memberCode: userLoginModel.value.memberCode);
    if(memberReferralModel.value.pendingReferrals.isNotEmpty) {
      pendingReferral.value =memberReferralModel.value.pendingReferrals;
    }
    if(memberReferralModel.value.approvedReferrals.isNotEmpty) {
      approvedReferral.value =memberReferralModel.value.approvedReferrals;
    }
    if(memberReferralModel.value.qualifiedReferrals.isNotEmpty) {
      qualifiedReferral.value =memberReferralModel.value.qualifiedReferrals;
    }
  }


  RxList<Map<String, dynamic>> designConsultationScheduledList = [
    {
      "name" :"Referral Full Name ",
      "status" : "Last Update",
      "onTap": (){

      }
    },
    {
      "name" :"Referral Full Name ",
      "status" : "Last Update",
      "onTap": (){

      }
    },
    {
      "name" :"Referral Full Name ",
      "status" : "Last Update",
      "onTap": (){

      }
    },
  ].obs;
}