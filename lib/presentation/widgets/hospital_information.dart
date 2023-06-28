
import 'package:flutter/material.dart';
import 'package:graduation/core/utils/constants.dart';

class HospitalInformation extends StatelessWidget{
  const HospitalInformation({super.key,
    required this.icon,
    required this.text,
    this.fontWeight,
    required this.subTitle});

  final IconData icon;
  final String text;
  final String subTitle;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return   ListTile(
      leading: Icon(icon,size: 32,color: Colors.black,),
      title: Text(
          text,style:  TextStyle(
          fontSize: 18,
          fontWeight: fontWeight)),
      subtitle:Text(subTitle,style: const TextStyle(color: Colors.black)) ,
    )
    ;
  }


}