import 'package:flutter/material.dart';
import '../widgets/notification_body.dart';

class NotificationView extends StatelessWidget{
  const NotificationView ({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   backgroundColor: kPrimaryColor,
      //   elevation: 1.5,
      //   title: const Text("Notification" ,
      //     style: TextStyle(fontSize: 30,color: Colors.black),),),
      body: NotificationBody(),
    );
  }

}

