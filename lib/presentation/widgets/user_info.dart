
import 'package:flutter/material.dart';

import '../../core/widgets/custom_text.dart';

class UserInfo extends StatelessWidget{
  const UserInfo({super.key,
    this.label,
    this.text,
    this.labelSize,
    this.textSize, this.margin,
    // this.textColor,
    });

  final String? label;
  final String? text;
  final double? labelSize;
  final double? textSize;
  final EdgeInsetsGeometry? margin;
  // final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
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
                fontSize: textSize,
                // color: textColor!
              ),),


            ],
          ),
      
    );
  }


}

class StatusInfo extends StatelessWidget{
  const StatusInfo({super.key, required this.statusLabel, required this.state});
  final String statusLabel;
  final String state;
  @override
  Widget build(BuildContext context) {
    final String statusText;
    final Color color;
    if(state=="0"){
       statusText="pending";
       color =Colors.amber;
    }else if(state=="1"){
       statusText="Accepted";
       color =Colors.green;
    }else{
       statusText="rejected";
       color =Colors.red;
    }
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Text(statusLabel,style:const TextStyle(fontWeight: FontWeight.bold),),
          Center(
            child: StatusText(
              text: statusText,
              color: color,),
          ),
        ],
      ),
    );
  }

}