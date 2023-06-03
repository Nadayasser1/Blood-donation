import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
void Toastmessage(BuildContext context,String? message,Color? color){

  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
    content: Text(message!),
    backgroundColor: color,
    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

  ));
}