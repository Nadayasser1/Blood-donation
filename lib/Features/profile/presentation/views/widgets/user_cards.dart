import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../../../core/widgets/constants.dart';

class ProfileCards extends StatelessWidget{
  const ProfileCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                color: cardsColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(MdiIcons.bloodBag,size: 50,),
                Text("live Saved"),
                Text("30")
              ],
            ),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                color: cardsColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.bloodtype,size: 50,),
                Text("Blood Type"),
                Text("A-")
              ],
            ),

          ),
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                color: cardsColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.calendar_month,size: 50,),
                Text("Last Donation"),
                Text("24/5/2022")
              ],
            ),

          )

        ],
      ),
    )
 

;
}}
  