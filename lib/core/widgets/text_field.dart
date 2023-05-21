
import 'package:flutter/material.dart';

import 'constants.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType? inputType;
  final Widget? suffexIcon;
  final ValueSetter? onSaved;
  final ValueSetter? onChanged;
  final int? maxLines;
  final String? text;
  const CustomTextFormField({
    Key? key,
    @required this.inputType,
    this.suffexIcon,
    @required this.onSaved,
    this.onChanged,
    this.maxLines, this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        keyboardType: inputType,
        onChanged: onChanged,
        onSaved: onSaved,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText:text ,
          filled: true,
          fillColor: kPrimaryColor,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.black54,
              )),

        ),

      ),
    );
  }
}
