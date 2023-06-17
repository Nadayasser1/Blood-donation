
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget{
  const UserInfo({super.key, this.label, this.text});
  final String? label;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Text(label!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
              Text(text!,style: const TextStyle(
                fontSize: 16
              ),)
            ],
          ),
        ],
      ),
    );
  }


}