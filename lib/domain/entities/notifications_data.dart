

  import 'package:equatable/equatable.dart';

class NotificationsData extends Equatable{

  final String notifyTitle ;
  final String notifyBody ;

 const NotificationsData({
    required this.notifyTitle,
    required this.notifyBody,
  });

  @override
  List<Object?> get props =>[
    notifyTitle,
    notifyBody,
  ];

}