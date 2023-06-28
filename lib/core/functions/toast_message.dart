import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
void Toastmessage(BuildContext context,String? message){

  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
    content: Text(message!,
      textAlign:TextAlign.center,
      style: const TextStyle(color: Colors.black)),
    backgroundColor: Colors.white70 ,
    elevation: 1,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 2),
    margin: const EdgeInsets.only(left: 80,right: 80),
    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

  ));
}