import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:graduation/core/widgets/custom_text.dart';
import 'constants.dart';

class MainButton extends StatelessWidget{
  const MainButton({
  super.key,
  this.text,
  this.onTap,
  this.onPressed,
  this.onLongPress,
  this.onHover,
  this.onFocusChange,});

final String? text;
final VoidCallback? onPressed;
final VoidCallback? onLongPress;
final ValueChanged<bool>? onHover;
final ValueChanged<bool>? onFocusChange;
final VoidCallback? onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 90,
        decoration: BoxDecoration(
          color: CupertinoColors.systemGroupedBackground,
          borderRadius: BorderRadius.circular(15),
        ),
        child:  Center(
          child: Text(
            text!,
            style:const TextStyle(
              fontSize: 15,
              color: kTextColor,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      )
      ,
    );
  }

}

class DataEntryfield extends StatelessWidget{
  const DataEntryfield({super.key, this.label, this.text, this.inputType});
  final String? label;
  final String? text;
  final TextInputType? inputType;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(
          label: label,
        ),
        const SizedBox(height: 5,),
        CustomTextFormField(
          text: text,
        )

      ],
    );
  }

}


class CustomTextFormField extends StatelessWidget {
  final Widget? suffexIcon;
  final String? text;
  final String? message;
  bool? obscureText;
  Function(String)? onChanged;
  Function(String)? onSubmitted;

   CustomTextFormField({Key? key,
     this.obscureText =false,
     this.suffexIcon,
     this.onChanged,
     this.onSubmitted,
      this.text, this.message,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        validator: RequiredValidator(errorText: message!),
        obscureText: obscureText!,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
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







class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final ValueChanged<String> onSubmit;
  final ValueChanged<String>? onChange;
  final String Function(String?) validator;
  final String label;
  final String text;
  final IconData prefix;
  final IconData? suffix;
  final bool isPassword;
  final void Function()? suffixPress;


  const CustomTextField({
     key,
    this.controller,
    this.type,
    required this.onSubmit,
    this.onChange,
     required this.validator,
    required this.label,
     required this.prefix,
    this.suffix,
    this.isPassword = false,
    this.suffixPress, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller:controller,
        keyboardType: type,
        onChanged: onChange,
        onFieldSubmitted: onSubmit,
        validator: validator,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          hintText: text ,
          filled: true,
          fillColor: kPrimaryColor,
          prefixIcon: Icon(prefix),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.black54,
              )
          ),
            focusedBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                color: kSecColor
              )
            ),
          suffixIcon: suffix !=null?IconButton(
            onPressed:suffixPress,
            icon: Icon(suffix,),
          ) :null ,
        ),

    );
  }
}

