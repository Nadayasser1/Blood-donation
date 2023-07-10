

import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomAlertDialog extends StatelessWidget{
  const CustomAlertDialog({super.key,
    required this.title,
    required this.content});

  final String title;
  final String content;



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text(title,textAlign: TextAlign.center),
      backgroundColor: kSecColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10 )),
      titleTextStyle: const TextStyle(
          fontSize: 18,
          color: kPrimaryColor,
          fontWeight: FontWeight.bold),
      content: Text(content),
      contentTextStyle: const TextStyle(
        color: kPrimaryColor,
      ),
      actions: [
        Center(
          child: ElevatedButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              style:  const ButtonStyle(backgroundColor: MaterialStatePropertyAll(kPrimaryColor)),
              child: const Text("Ok",style: TextStyle(color: Colors.black),)),
        )
      ],

    );
  }


}