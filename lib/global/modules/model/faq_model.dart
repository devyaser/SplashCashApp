class FAQModel {
  List<AboutModel> listOfAboutModel=[];
  List<TrackingReferralModel> listOfTrackingReferralsModel=[];

  FAQModel.empty();

  FAQModel({required this.listOfAboutModel, required this.listOfTrackingReferralsModel});

  FAQModel.fromJson(Map<String, dynamic> json) {
    if (json['about'] != null) {
      listOfAboutModel = <AboutModel>[];
      json['about'].forEach((v) {
        listOfAboutModel.add(AboutModel.fromJson(v));
      });
    }
    if (json['trackingReferrals'] != null) {
      listOfTrackingReferralsModel = <TrackingReferralModel>[];
      json['trackingReferrals'].forEach((v) {
        listOfTrackingReferralsModel.add(TrackingReferralModel.fromJson(v));
      });
    }
  }

  @override
  String toString() {
    return 'FAQModel{listOfAboutModel: $listOfAboutModel, listOfTrackingReferralsModel: $listOfTrackingReferralsModel}';
  }
}

class AboutModel {
  int sort=0;
  String section='';
  String question='';
  String answer='';

  AboutModel.empty();

  AboutModel({required this.sort, required this.section, required this.question, required this.answer});

  AboutModel.fromJson(Map<String, dynamic> json) {
    sort = json['sort']??0;
    section = json['section']??'';
    question = json['question']??'';
    answer = json['answer']??'';
  }

  @override
  String toString() {
    return 'AboutModel{sort: $sort, section: $section, question: $question, answer: $answer}';
  }
}

class TrackingReferralModel {
  int sort=0;
  String section='';
  String question='';
  String answer='';

  TrackingReferralModel({required this.sort, required this.section, required this.question, required this.answer});

  TrackingReferralModel.fromJson(Map<String, dynamic> json) {
    sort = json['sort']??0;
    section = json['section']??'';
    question = json['question']??'';
    answer = json['answer']??'';
  }

  @override
  String toString() {
    return 'TrackingReferralModel{sort: $sort, section: $section, question: $question, answer: $answer}';
  }
}