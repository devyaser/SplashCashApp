import 'dart:convert';
import 'package:splashcashapp/global/modules/model/marketing_notification_model.dart';
import 'package:splashcashapp/global/web_services/web_service_url.dart';
import '../modules/model/response_model.dart';
import 'http_request_client.dart';

class MarketingServices{

  MarketingServices._internalPrivateConstructor();

  static final MarketingServices _instance = MarketingServices._internalPrivateConstructor();

  factory MarketingServices(){
    return _instance;
  }

  final HttpRequestClient _httpRequestClient = HttpRequestClient();

  Future<List<MarketingNotificationModel>> getMarketingNotificationModel()async{
    List<MarketingNotificationModel> marketingNotificationModel=<MarketingNotificationModel>[];
    ResponseModel responseModel = await _httpRequestClient.getRequestWithOutHeader(
        url: kGetMarketingNotificationsUrl,isTokenRequired: true);
    if(responseModel.statusCode>=200 && responseModel.statusCode<=230 && responseModel.data.length > 0){
      List marketingNotificationList=json.decode(responseModel.data).toList();
      for(int i=0;i<marketingNotificationList.length;i++) {
        marketingNotificationModel.add(MarketingNotificationModel.fromJson(marketingNotificationList[i]));
      }
      return marketingNotificationModel;
    }
    return marketingNotificationModel;

  }



}