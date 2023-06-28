
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import '../../core/utils/constants.dart';



class QuestionForm extends StatelessWidget{
  const QuestionForm({super.key, required this.question,});

  final String question;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height *0.08,
      child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(question,textAlign: TextAlign.justify),
              GroupButton(
                  buttons: const ['Yes','No'],
                options: GroupButtonOptions(
                     buttonHeight: 30,
                     buttonWidth: 50,
                    borderRadius: BorderRadius.circular(10),
                    selectedColor: kSecColor,
                    unselectedBorderColor: kSecColor),
                onSelected: (value, index, isSelected) {},
              )
            ],
          ),


    );
  }


}