

  import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:graduation/core/services/services_locator.dart';
import 'package:graduation/core/services/shared_preferences.dart';

import '../../presentation/pages/bottom_appbar.dart';
  final AppPreferences appPreferences=sl<AppPreferences>();
Future<void> handleBackgroundMessage (RemoteMessage message)async{

  Get.to(()=> const BottomNavbar());

}


class FireBaseNotifications {
  final _fireBaseMessaging =FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
    description: 'this channel is used for important notifications',
    importance: Importance.defaultImportance,
      );

  final _localNotifications = FlutterLocalNotificationsPlugin();

  void handleMessage (RemoteMessage? message){
    if(message==null) return;
    Get.to(()=> const BottomNavbar());
  }

  Future initLocationNotifications()async{
    const iOS =IOSInitializationSettings();
    const android = AndroidInitializationSettings('@drawable/logo2_removebg_preview');
    const setting = InitializationSettings(android:android,iOS: iOS);

    await _localNotifications.initialize(
      setting,
      onSelectNotification: (payload){
        final message = RemoteMessage.fromMap(jsonDecode(payload!));
        handleMessage(message);
      }
    );
    final platForm= _localNotifications.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await platForm?.createNotificationChannel(_androidChannel);
  }

  Future initPushNotifications()async{
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification =message.notification;
      if(notification == null) return;
      _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _androidChannel.id,
              _androidChannel.name,
              channelDescription: _androidChannel.description,
              icon: '@drawable/logo2_removebg_preview',
            ),
          ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }


  Future<void> initNotifications() async  {
    await _fireBaseMessaging.requestPermission();
    final fCMToken = await _fireBaseMessaging.getToken();
    appPreferences.setNotificationsToken(fCMToken!);
    print( " this token========> ${appPreferences.getNotificationsToken()}");
    initPushNotifications();
    initLocationNotifications();
}
  }