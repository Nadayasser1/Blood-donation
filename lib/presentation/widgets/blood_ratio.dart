
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BloodRatio extends StatelessWidget{
  const BloodRatio({super.key,
    required this.bloodType,
    required this.footer,
    required this.percent});


  final String bloodType;
  final String footer;
  final double percent;



  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 35,
      lineWidth: 10,
      animation: true,
      animationDuration: 1000,
      percent: percent,
      center:  Text(bloodType,style: const TextStyle(fontWeight: FontWeight.bold)),
      footer:  Text(footer),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.red,
      );
  }


}