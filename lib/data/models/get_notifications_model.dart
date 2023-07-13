


  import 'package:graduation/data/models/get_notification_data_model.dart';

import '../../domain/entities/get_notifications.dart';

class GetNotificationsModel extends GetNotifications{
 const GetNotificationsModel({
   required super.message,
   required super.notifications,
 });

 factory GetNotificationsModel.fromJson(Map<String , dynamic>json)=>GetNotificationsModel(
     message: json["message"],
     notifications: List<NotificationsDataModel>.from(json["user"].map((e)=>NotificationsDataModel.fromJson(e))),
 );
}