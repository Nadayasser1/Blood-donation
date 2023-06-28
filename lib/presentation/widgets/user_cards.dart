import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../core/utils/constants.dart';

class ProfileCards extends StatelessWidget{
  const ProfileCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Cards(
              cardIcon: MdiIcons.bloodBag,
              text: "Live saved",
              date: "10"),
          Cards(
              cardIcon: Icons.bloodtype,
              text: "Blood type",
              date: "A-"),
          Cards(
              cardIcon: Icons.calendar_month_outlined,
              text: "Last Donation",
              date: "24/5/2023"),

        ],
      ),
    );
}}

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