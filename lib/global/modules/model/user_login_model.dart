class UserLoginModel {
  String id='';
  String email='';
  String memberCode='';
  String token='';
  String refreshToken='';
  String programId='';
  UserShareLinks userShareLinks=UserShareLinks.empty();
  String firstName='';
  String lastName='';
  String errorMessage='';

  UserLoginModel.empty();

  UserLoginModel(
      {required this.id,
      required this.email,
      required this.memberCode,
      required this.token,
      required this.refreshToken,
      required this.programId,
      required this.userShareLinks,
      required this.firstName,
        required this.errorMessage,
      required this.lastName});

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id']??'';
    email = json['email']??'';
    memberCode = json['memberCode']??'';
    token = json['token']??'';
    refreshToken = json['refreshToken']??'';
    programId = json['programId']??'';
    userShareLinks =  UserShareLinks.fromJson(json['userShareLinks']??{});
    firstName = json['firstName']??'';
    lastName = json['lastName']??'';
  }

  UserLoginModel.fromSessionData(Map<String, dynamic> json){
    id = json['id']??'';
    email = json['email']??'';
    memberCode = json['memberCode']??'';
    token = json['token']??'';
    refreshToken = json['refreshToken']??'';
    programId = json['programId']??'';
    userShareLinks =  UserShareLinks.fromJson(json['userShareLinks']??{});
    firstName = json['firstName']??'';
    lastName = json['lastName']??'';
  }

  Map<String, dynamic> toJsonForSession() {
    Map<String, dynamic> json = {
      "token": token,
      "id": id,
    "email": email,
    "memberCode":memberCode,
    "refreshToken":refreshToken,
    "programId": programId,
    "firstName":firstName,
    "lastName":lastName,
    "userShareLinks":userShareLinks.toJsonForSession()
    };
    return json;
  }

  @override
  String toString() {
    return 'UserLoginModel{id: $id, email: $email, memberCode: $memberCode, token: $token, refreshToken: $refreshToken, programId: $programId, userShareLinks: $userShareLinks, firstName: $firstName, lastName: $lastName}';
  }


}

class UserShareLinks {
  String shareUrl='';
  String emailShareUrl='';
  String facebookShareUrl='';
  String? twitterShareUrl='';

  UserShareLinks.empty();

  UserShareLinks(
      {required this.shareUrl,
        required this.emailShareUrl,
        required this.facebookShareUrl,
        this.twitterShareUrl});

  UserShareLinks.fromJson(Map<String, dynamic> json) {
    shareUrl = json['shareUrl']??'';
    emailShareUrl = json['emailShareUrl']??'';
    facebookShareUrl = json['facebookShareUrl']??'';
    twitterShareUrl = json['twitterShareUrl']??'';
  }

  Map<String, dynamic> toJsonForSession(){
    Map<String, dynamic> json = {
      "shareUrl": shareUrl,
      "emailShareUrl": emailShareUrl,
      "facebookShareUrl": facebookShareUrl,
      "twitterShareUrl":twitterShareUrl,
  };
    return json;
  }

  @override
  String toString() {
    return 'UserShareLinks{shareUrl: $shareUrl, emailShareUrl: $emailShareUrl, facebookShareUrl: $facebookShareUrl, twitterShareUrl: $twitterShareUrl}';
  }
}