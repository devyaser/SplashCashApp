import 'dart:convert';
import 'package:splashcashapp/global/modules/model/member_referral_model.dart';
import 'package:splashcashapp/global/modules/model/referral_notifications_model.dart';
import 'package:splashcashapp/global/modules/model/referral_provider_model.dart';
import 'package:splashcashapp/global/web_services/web_service_url.dart';
import '../modules/model/response_model.dart';
import 'http_request_client.dart';

class ReferralServices{

  ReferralServices._internalPrivateConstructor();

  static final ReferralServices _instance = ReferralServices._internalPrivateConstructor();

  factory ReferralServices(){
    return _instance;
  }

  final HttpRequestClient _httpRequestClient = HttpRequestClient();

  Future<ReferralProviderModel> getReferralProviderModel({required String email})async{
    ReferralProviderModel referralProviderModel=ReferralProviderModel.empty();
    ResponseModel responseModel = await _httpRequestClient.getRequestWithOutHeader(
        url: '$kGetReferralProviderInfoUrl/$email',isTokenRequired: true);
    if(responseModel.statusCode>=200 && responseModel.statusCode<=230 && responseModel.data.length > 0){
        referralProviderModel=ReferralProviderModel.fromJson(jsonDecode(responseModel.data));
      return referralProviderModel;
    }
    return referralProviderModel;

  }

  Future<List<ReferralNotificationModel>> getReferralNotificationModel({required String userId})async{
    List<ReferralNotificationModel> referralNotificationModel=<ReferralNotificationModel>[];
    ResponseModel responseModel = await _httpRequestClient.getRequestWithOutHeader(
        url: '$kGetReferralNotificationsUrl/$userId',isTokenRequired: true);
    if(responseModel.statusCode>=200 && responseModel.statusCode<=230 && responseModel.data.length > 0){
      List referralNotificationModelList=json.decode(responseModel.data).toList();
      for(int i=0;i<referralNotificationModelList.length;i++) {
        referralNotificationModel.add(ReferralNotificationModel.fromJson(referralNotificationModelList[i]));
      }
      return referralNotificationModel;
    }
    return referralNotificationModel;

  }

  Future<String> markNotificationAsRead({required String notificationId})async{
    ResponseModel responseModel = await _httpRequestClient.putRequestWithOutHeader(url: '$kNotificationsMarkAsReadUrl/$notificationId',isTokenRequired: true);
    if(responseModel.statusCode>=200 && responseModel.statusCode<=230){
      return responseModel.statusDescription;
    }
    return responseModel.statusDescription;
  }

  Future<MemberReferralModel> getMemberReferralModel({required String memberCode})async{
    MemberReferralModel memberReferralModel=MemberReferralModel.empty();
    ResponseModel responseModel = await _httpRequestClient.getRequestWithOutHeader(
        url: '$kGetMemberReferralUrl/$memberCode',isTokenRequired: true);
    if(responseModel.statusCode>=200 && responseModel.statusCode<=230 && responseModel.data.length > 0){
      memberReferralModel=MemberReferralModel.fromJson(jsonDecode(responseModel.data));
      return memberReferralModel;
    }
    return memberReferralModel;

  }

  Future<String> createReferral({
    required String firstName,
    required String lastName,
    required String email,
    required String userId,
    required String memberCode,
    required String homePhone,
    required String workPhone,
    required String homeNum,
    required String streetAdd,
    required String city,
    required String zip,
    required String state,
    required String interest,
  })async{
    Map<String, dynamic> requestBody={
      "email" : email,
      "firstName" : firstName,
      "lastName": lastName,
      "userId": userId,
      "memberCode": memberCode,
      "homePhone": homePhone,
      "workPhone": workPhone,
      "address1": homeNum,
      "address2": streetAdd,
      "city": city,
      "state": state,
      "zip": zip,
      "interested": interest
    };
    ResponseModel responseModel = await _httpRequestClient.postRequestWithToken(url: kCreateReferralUrl,requestBody: requestBody,isTokenRequired: true);
    if(responseModel.statusCode>=200 && responseModel.statusCode<=230){
      return responseModel.statusDescription;
    }
    return responseModel.statusDescription;
  }
}