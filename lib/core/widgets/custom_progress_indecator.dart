


import 'package:flutter/cupertino.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../utils/constants.dart';

class CustomProgressIndecator extends StatelessWidget{
  const CustomProgressIndecator({super.key});



  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 50,
      height: 50,
      child: LoadingIndicator(
        indicatorType: Indicator.ballSpinFadeLoader,
        colors: [kSecColor],
        strokeWidth: 3,
      ),
    );
  }



}
