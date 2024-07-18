class ResponseModel{
  int statusCode = -1;
  String statusDescription = "";
  dynamic data ="";
  Map<String,String> header = {};

  ResponseModel();

  ResponseModel.named({required this.statusCode, required this.statusDescription, this.data});


  ResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = int.parse((json["statusCode"]??"0").toString());
    statusDescription = json["statusDescription"]??"";
    data = json["data"];
  }

  ResponseModel.errorFromJson(Map<String, dynamic> json){
    statusCode = json['code'] ?? -1;
    statusDescription = json['message'] ?? '';
    if(json["errors"]!=null && json["errors"] is String){
      statusDescription = json["errors"] ?? '';
    }else  if(json["errors"]["Register"]!=null && json["errors"]["Register"] is String){
      statusDescription = json["errors"]["Register"] ?? '';
    }else  if(json["errors"]["Forgot"]!=null && json["errors"]["Forgot"] is String){
      statusDescription = json["errors"]["Forgot"] ?? '';
    }else  if(json["errors"]["errors"]!=null && json["errors"]["errors"] is String){
      statusDescription = json["errors"]["errors"] ?? '';
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'statusDescription': statusDescription,
      'data': data,
    };
  }

  @override
  String toString() {
    return 'ResponseModel{statusCode: $statusCode, statusDescription: $statusDescription, data: $data, header: $header}';
  }
}