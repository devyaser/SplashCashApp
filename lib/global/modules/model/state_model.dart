class StateModel {
  String state='';
  String abbreviation='';
  String capitalCity='';
  String dateEstablished='';

  StateModel({required this.state, required this.abbreviation, required this.capitalCity, required this.dateEstablished});

  StateModel.empty();

  StateModel.fromJson(Map<String, dynamic> json) {
    state = json['state']??'';
    abbreviation = json['abbreviation']??'';
    capitalCity = json['capitalCity']??'';
    dateEstablished = json['dateEstablished']??'';
  }

  @override
  String toString() {
    return 'StateModel{state: $state, abbreviation: $abbreviation, capitalCity: $capitalCity, dateEstablished: $dateEstablished}';
  }
}