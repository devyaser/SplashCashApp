class MemberReferralModel {
  List<PendingReferrals> pendingReferrals=[];
  List<QualifiedReferrals> qualifiedReferrals=[];
  List<ApprovedReferrals> approvedReferrals=[];

  MemberReferralModel.empty();

  MemberReferralModel.fromJson(Map<String, dynamic> json) {
    if (json['pendingReferrals'] != null) {
      pendingReferrals = <PendingReferrals>[];
      json['pendingReferrals'].forEach((v) {
        pendingReferrals.add(PendingReferrals.fromJson(v));
      });
    }
    if (json['qualifiedReferrals'] != null) {
      qualifiedReferrals = <QualifiedReferrals>[];
      json['qualifiedReferrals'].forEach((v) {
        qualifiedReferrals.add(QualifiedReferrals.fromJson(v));
      });
    }
    if (json['approvedReferrals'] != null) {
      approvedReferrals = <ApprovedReferrals>[];
      json['approvedReferrals'].forEach((v) {
        approvedReferrals.add(ApprovedReferrals.fromJson(v));
      });
    }
  }

  @override
  String toString() {
    return 'MemberReferralModel{pendingReferrals: $pendingReferrals, qualifiedReferrals: $qualifiedReferrals, approvedReferrals: $approvedReferrals}';
  }
}

class PendingReferrals {
  String referralFirstName="";
  String referralLastName="";
  String referralStatus="";
  String firstAppointment="";
  String signDate="";
  String digDate="";

  PendingReferrals.empty();

  PendingReferrals.fromJson(Map<String, dynamic> json) {
    referralFirstName = json['ReferralFirstName']??"";
    referralLastName = json['ReferralLastName']??"";
    referralStatus = json['referralStatus']??"";
    firstAppointment = json['FirstAppointment']??"";
    signDate = json['SignDate']??"";
    digDate = json['Digdate']??"";
  }

  @override
  String toString() {
    return 'PendingReferrals{referralFirstName: $referralFirstName, referralLastName: $referralLastName, referralStatus: $referralStatus, firstAppointment: $firstAppointment, signDate: $signDate, digDate: $digDate}';
  }
}

class ApprovedReferrals {
  String referralFirstName='';
  String referralLastName='';
  String referralStatus='';
  String firstAppointment='';
  String signDate='';
  String digDate='';

  ApprovedReferrals.empty();

  ApprovedReferrals.fromJson(Map<String, dynamic> json) {
    referralFirstName = json['ReferralFirstName']??"";
    referralLastName = json['ReferralLastName']??"";
    referralStatus = json['referralStatus']??"";
    firstAppointment = json['FirstAppointment']??"";
    signDate = json['SignDate']??"";
    digDate = json['Digdate']??"";
  }

  @override
  String toString() {
    return 'ApprovedReferrals{referralFirstName: $referralFirstName, referralLastName: $referralLastName, referralStatus: $referralStatus, firstAppointment: $firstAppointment, signDate: $signDate, digDate: $digDate}';
  }
}

class QualifiedReferrals {
  String referralFirstName="";
  String referralLastName="";
  String referralStatus="";
  String firstAppointment="";
  String signDate="";
  String digDate="";

  QualifiedReferrals.empty();

  QualifiedReferrals.fromJson(Map<String, dynamic> json) {
    referralFirstName = json['ReferralFirstName']??"";
    referralLastName = json['ReferralLastName']??"";
    referralStatus = json['referralStatus']??"";
    firstAppointment = json['FirstAppointment']??"";
    signDate = json['SignDate']??"";
    digDate = json['Digdate']??"";
  }

  @override
  String toString() {
    return 'QualifiedReferrals{referralFirstName: $referralFirstName, referralLastName: $referralLastName, referralStatus: $referralStatus, firstAppointment: $firstAppointment, signDate: $signDate, digDate: $digDate}';
  }
}