
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/constants.dart';

class CustomIndecator extends StatelessWidget{
   const CustomIndecator({super.key, this.index,});
  final double? index ;


  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
        dotsCount: 3,
        position: index! ,
        decorator: DotsDecorator(
          color: Colors.transparent,
          activeColor: kSecColor,
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          shape: const CircleBorder(side: BorderSide(color: kSecColor)),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),)

    ;
  }


}