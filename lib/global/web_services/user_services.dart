import 'package:splashcashapp/global/modules/model/user_login_model.dart';
import 'package:splashcashapp/global/web_services/web_service_url.dart';
import '../constants/constants.dart';
import '../modules/model/response_model.dart';
import 'http_request_client.dart';

class UserServices{

  UserServices._internalPrivateConstructor();

  static final UserServices _instance = UserServices._internalPrivateConstructor();

  factory UserServices(){
    return _instance;
  }

  final HttpRequestClient _httpRequestClient = HttpRequestClient();

  Future<String> registerUser({required String email,required String password})async{
    Map<String, dynamic> requestBody={
      "email" : email,
      "password" : password,
    };
    ResponseModel responseModel = await _httpRequestClient.postRequest(url: kUserRegistrationUrl,requestBody: requestBody,isTokenRequired: true);

    if(responseModel.statusCode>=200 && responseModel.statusCode<=230){
      return responseModel.statusDescription;
    }else{
      return responseModel.statusDescription;
    }
  }

  Future<UserLoginModel> loginUser({required String email,required String password})async{
    UserLoginModel userLoginModel = UserLoginModel.empty();
    Map<String, dynamic> requestBody={
      "email" : email,
      "password" : password,
    };
    ResponseModel responseModel = await _httpRequestClient.postRequest(url: kUserLoginUrl,requestBody: requestBody,isTokenRequired: true);

    if((responseModel.statusCode == 400 || responseModel.statusCode == 500 )){
      userLoginModel.errorMessage = kNetworkError;
      return userLoginModel;
    }else if(responseModel.statusCode == 408){
      userLoginModel.errorMessage = kPoorInternetConnection;
      return userLoginModel;
    }else if(responseModel.statusCode>=200 && responseModel.statusCode<=230){
      userLoginModel = UserLoginModel.fromJson(responseModel.data);
      return userLoginModel;

    }
    userLoginModel.errorMessage = responseModel.statusDescription;
    return userLoginModel;
  }

  Future<String> changePassword({required String oldPassword,required String newPassword,required String email})async{
    Map<String, dynamic> requestBody={
      "email" : email,
      "newpassword" : newPassword,
      "oldpassword": oldPassword
    };
    ResponseModel responseModel = await _httpRequestClient.postRequestWithToken(url: kChangePasswordUrl,requestBody: requestBody,isTokenRequired: true);
    if(responseModel.statusCode>=200 && responseModel.statusCode<=230){
      return responseModel.statusDescription;
    }
    return responseModel.statusDescription;
  }

  Future<dynamic> forgotPassword({required String email,required String platform})async{
    Map<String, dynamic> requestBody={
      "email":email,
      "platform":platform
    };
    ResponseModel responseModel = await _httpRequestClient.postRequest(url: kForgotPasswordUrl,requestBody: requestBody,isTokenRequired: true);
    if(responseModel.statusCode>=200 && responseModel.statusCode<=230){
      if(responseModel.statusDescription!=""){
        return responseModel.statusDescription;
      }
    }else{
      return responseModel.statusDescription;
    }
  }

  Future<dynamic> resetPassword({required String email,required String password,required code})async{
    Map<String, dynamic> requestBody={
      "email":email,
      "password":password,
      "accesscode":code
    };
    ResponseModel responseModel = await _httpRequestClient.postRequest(url: kResetPasswordUrl,requestBody: requestBody,isTokenRequired: true);
    if(responseModel.statusCode>=200 && responseModel.statusCode<=230){
      if(responseModel.statusDescription!=""){
        return responseModel.statusDescription;
      }
    }else{
      return responseModel.statusDescription;
    }
  }

  Future<String> isTokenValid()async{
    ResponseModel responseModel = await _httpRequestClient.getRequestWithOutHeader(url: kisTokenValidUrl,isTokenRequired: true);
    if(responseModel.statusCode>=200 && responseModel.statusCode<=230){
      return responseModel.statusDescription;
    }
    return responseModel.statusDescription;
  }



}