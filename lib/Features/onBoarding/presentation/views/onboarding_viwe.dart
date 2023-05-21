

import 'package:flutter/material.dart';
import 'package:graduation/Features/onBoarding/presentation/views/widgets/onboarding_view_body.dart';

class OnBoarding extends StatelessWidget{
  const OnBoarding({super.key});


  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: OnBoardingBody(),
    );
  }

}