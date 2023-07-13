


import 'package:graduation/domain/entities/notifications_data.dart';

class NotificationsDataModel extends NotificationsData{
 const NotificationsDataModel({
   required super.notifyTitle,
   required super.notifyBody,
 });

 factory NotificationsDataModel.fromJson(Map<String ,dynamic >json)=>NotificationsDataModel(
     notifyTitle: json["NotifyTitle"],
     notifyBody: json["NotifyBody"],
 );

}