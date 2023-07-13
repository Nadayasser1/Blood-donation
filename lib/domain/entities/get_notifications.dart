
 import 'package:equatable/equatable.dart';
import 'package:graduation/domain/entities/notifications_data.dart';

class GetNotifications extends Equatable{

  final String message ;
  final List<NotificationsData> notifications ;

 const GetNotifications({
    required this.message,
    required this.notifications,
  });

  @override
  List<Object?> get props => [
    message,
    notifications,
  ];

}