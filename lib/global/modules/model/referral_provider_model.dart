class ReferralProviderModel {
  String firstName='';
  String lastName='';
  String referralCode='';
  String shareUrl='';
  String smsShareUrl='';
  String facebookShareUrl='';
  String facebookMessengerShareUrl='';
  String twitterShareUrl='';
  String emailShareUrl='';
  String webShareUrl='';

  ReferralProviderModel.empty();

  ReferralProviderModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName']??'';
    lastName = json['lastName']??'';
    referralCode = json['referralCode']??'';
    shareUrl = json['shareUrl']??'';
    smsShareUrl = json['smsShareUrl']??'';
    facebookShareUrl = json['facebookShareUrl']??'';
    facebookMessengerShareUrl = json['facebookMessengerShareUrl']??'';
    twitterShareUrl = json['twitterShareUrl']??'';
    emailShareUrl = json['emailShareUrl']??'';
    webShareUrl = json['webShareUrl']??'';
  }

  @override
  String toString() {
    return 'ReferralProviderModel{firstName: $firstName, lastName: $lastName, referralCode: $referralCode, shareUrl: $shareUrl, smsShareUrl: $smsShareUrl, facebookShareUrl: $facebookShareUrl, facebookMessengerShareUrl: $facebookMessengerShareUrl, twitterShareUrl: $twitterShareUrl, emailShareUrl: $emailShareUrl, webShareUrl: $webShareUrl}';
  }
}