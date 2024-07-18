import 'dart:convert';
import 'dart:developer';

import 'package:splashcashapp/global/modules/model/faq_model.dart';
import 'package:splashcashapp/global/modules/model/user_login_model.dart';
import 'package:splashcashapp/global/web_services/web_service_url.dart';
import '../constants/constants.dart';
import '../modules/model/response_model.dart';
import 'http_request_client.dart';

class FAQServices{

  FAQServices._internalPrivateConstructor();

  static final FAQServices _instance = FAQServices._internalPrivateConstructor();

  factory FAQServices(){
    return _instance;
  }

  final HttpRequestClient _httpRequestClient = HttpRequestClient();

  Future<FAQModel> getFAQModel()async{
    FAQModel faqModel=FAQModel.empty();
    ResponseModel responseModel = await _httpRequestClient.getRequestWithOutHeader(
        url: kFAQUrl,isTokenRequired: true);
     if(responseModel.statusCode>=200 && responseModel.statusCode<=230){
       faqModel=FAQModel.fromJson(jsonDecode(responseModel.data));
      return faqModel;
    }
    return faqModel;

  }



}