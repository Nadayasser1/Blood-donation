part of 'get_notifications_cubit.dart';

abstract class GetNotificationsState {}

class GetNotificationsInitial extends GetNotificationsState {}

class GetNotificationsLoadingState extends GetNotificationsState{
}

class GetNotificationsSuccessState extends GetNotificationsState{
  final GetNotifications notifications;

  GetNotificationsSuccessState(this.notifications);



}

class GetNotificationsErrorState extends GetNotificationsState{
  final String error;

  GetNotificationsErrorState(this.error);

}
