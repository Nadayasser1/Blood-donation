import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../core/utils/constants.dart';


class Cards extends StatelessWidget{
  const Cards({super.key, required this.cardIcon, required this.text, required this.date});

  final IconData cardIcon;
  final String text;
  final String date;


  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
          color: cardsColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:  [
          Icon(cardIcon,size: 50,color: Colors.white,),
          Text(text,style: const TextStyle(color: Colors.white)),
          Text(date,style: const TextStyle(color: Colors.white),)
        ],
      ),
    )
    ;
  }


}