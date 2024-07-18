import 'package:connectivity_plus/connectivity_plus.dart';
import '../modules/model/response_model.dart';
import '../web_services/http_request_client.dart';


class CommonCode {
  static final CommonCode _instance = CommonCode._internal();
  CommonCode._internal();
  factory CommonCode() => _instance;

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }

  Future<bool> checkInternetAccess() async {
    HttpRequestClient httpClient = HttpRequestClient();
    ResponseModel response = await httpClient.getRequestWithOutHeader(
        url: "https://www.google.com/");
    if (response.statusCode != 400 && response.statusCode != 408 &&
        response.statusCode != 500) {
      return await checkInternetConnection() && true;
    }
    return await checkInternetConnection() && false;
  }




}