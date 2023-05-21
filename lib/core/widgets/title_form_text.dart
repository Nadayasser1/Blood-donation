

import 'package:flutter/material.dart';

class TitleText extends StatelessWidget{
  const TitleText({super.key, this.label});
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Text(label!,
      style: const TextStyle(fontSize: 20),
      textHeightBehavior:
      const TextHeightBehavior(
          applyHeightToFirstAscent: false),
      textAlign: TextAlign.center,
    )
    ;
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
  const TopBarText( {super.key, this.text});
final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(text!,
      style:
      const TextStyle(fontSize: 28,
          fontWeight:
          FontWeight.bold),);
  }

}