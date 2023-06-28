
import 'package:flutter/material.dart';

import '../../core/widgets/custom_text.dart';

class UserInfo extends StatelessWidget{
  const UserInfo({super.key,
    this.label,
    this.text,
    this.labelSize,
    this.textSize});

  final String? label;
  final String? text;
  final double? labelSize;
  final double? textSize;


  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Text(label!,
              style:  TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: labelSize
              ),),
              Text(text!,style:  TextStyle(
                fontSize: textSize
              ),),


            ],
          ),
      
    );
  }


}

class StatusInfo extends StatelessWidget{
  const StatusInfo({super.key, required this.statusLabel, required this.statusText, required this.statusColor});
  final String statusLabel;
  final String statusText;
  final Color  statusColor;



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Text(statusLabel,style: TextStyle(fontWeight: FontWeight.bold),),
          Center(
            child: StatusText(
              text: statusText,
              color: statusColor,),
          ),
        ],
      ),
    );
  }

}