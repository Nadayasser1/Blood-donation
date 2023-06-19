import 'package:flutter/material.dart';

class TitleText extends StatelessWidget{
  const TitleText({super.key, this.label, this.color, this.size, this.fontWeight});
  final String? label;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(label!,
      style:  TextStyle(
        fontWeight: fontWeight,
          color: color,
          fontSize: size));


  }
}


class SignOptionsText extends StatelessWidget{
  const SignOptionsText({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Text(title!,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 14,
          color: Colors.black54),)

    ;
  }

}

class TopBarText extends StatelessWidget{

  final String? text;
  final Color color;

  const TopBarText( {super.key,
    this.text,
    required this.color});


  @override
  Widget build(BuildContext context) {
    return Text(text!,
      style:
       TextStyle(fontSize: 28,
          color: color,
          fontWeight:
          FontWeight.bold),);
  }

}