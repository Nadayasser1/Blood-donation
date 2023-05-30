

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void Toastmessage(BuildContext context,String? message,Color? color){

  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
    content: Text(message!),
    backgroundColor: color,
    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

  ));
}