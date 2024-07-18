class ReferralNotificationModel {
  String id="";
  String userId="";
  String userMemberCode="";
  String referralFirstName="";
  String referralLastName="";
  String referralEmailAddress="";
  String referralType="";
  String referralStatus="";
  bool isRead=false;
  String dateEntered="";

  ReferralNotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id']??"";
    userId = json['userId'];
    userMemberCode = json['userMemberCode']??"";
    referralFirstName = json['referralFirstName']??"";
    referralLastName = json['referralLastName']??"";
    referralEmailAddress = json['referralEmailAddress']??"";
    referralType = json['referralType']??"";
    referralStatus = json['referralStatus']??"";
    isRead = json['isRead']??false;
    dateEntered = json['dateEntered']??"";
  }

  @override
  String toString() {
    return 'ReferralNotificationModel{id: $id, userId: $userId, userMemberCode: $userMemberCode, referralFirstName: $referralFirstName, referralLastName: $referralLastName, referralEmailAddress: $referralEmailAddress, referralType: $referralType, referralStatus: $referralStatus, isRead: $isRead, dateEntered: $dateEntered}';
  }
}