
import 'package:graduation/Features/Splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/constants.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // body contain code that create splash view
      // call widget was created in widget folder
      body: SplashViewbody(),
    );
  }
}
