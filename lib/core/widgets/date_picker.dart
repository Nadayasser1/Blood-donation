

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CustomDatePicker extends StatelessWidget{
  const CustomDatePicker({super.key, required this.controller,});

  final TextEditingController controller;




  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      cursorColor: kSecColor,

      controller: controller,
      initialValue: null,
      decoration: InputDecoration(
        hintText: "yy/mm/dd",
        contentPadding: const EdgeInsets.all(0),
        prefixIcon: const Icon(Icons.calendar_month_outlined),
        border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black54,
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: kSecColor)),
      ),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      validator: (value) {
        if(value!.isEmpty){
          return 'please enter your birth date';
        }
        return null;
      },
    )
    ;
  }


}