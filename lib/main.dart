import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Features/splash/presentation/views/splash_view.dart';
import 'core/widgets/constants.dart';

void main() {
  runApp(const DonationApp());
}

class DonationApp extends StatelessWidget{
  const DonationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false ,
      theme:ThemeData.light()
      .copyWith( scaffoldBackgroundColor: kPrimaryColor),
      home: const SplashView(),

    );
  }

}
