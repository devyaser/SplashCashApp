class MarketingNotificationModel {
  String id='';
  String title='';
  String notificationContent='';
  bool active=false;
  String dateCreated='';

  MarketingNotificationModel.empty();

  MarketingNotificationModel(
      {required this.id,
        required this.title,
        required this.notificationContent,
        required this.active,
        required this.dateCreated});

  MarketingNotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id']??'';
    title = json['title']??'';
    notificationContent = json['notificationContent']??'';
    active = json['active']??false;
    dateCreated = json['dateCreated']??'';
  }

  @override
  String toString() {
    return 'MarketingNotificationModel{id: $id, title: $title, notificationContent: $notificationContent, active: $active, dateCreated: $dateCreated}';
  }
}