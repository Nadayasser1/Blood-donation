import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class MainButton extends StatelessWidget{
  const MainButton({
  super.key,
  this.text,
  this.onTap,
  this.onPressed,
  this.onLongPress,
  this.onHover,
  this.onFocusChange, this.onSelected, });

final String? text;
final VoidCallback? onPressed;
final VoidCallback? onLongPress;
final ValueChanged<bool>? onHover;
final ValueChanged<bool>? onSelected;
final ValueChanged<bool>? onFocusChange;
final VoidCallback? onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 85,
        decoration: BoxDecoration(
          color: CupertinoColors.systemGroupedBackground,
          borderRadius: BorderRadius.circular(15),
        ),
        child:  Center(
          child: Text(
            text!,
            style:const TextStyle(
              fontSize: 18,
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






class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String>? onChange;
  final String? Function(String?) validator;
  final String? label;
  final String? text;
  final IconData? prefix;
  final IconData? suffix;
  final bool isPassword;
  final void Function()? suffixPress;


  const CustomTextField({
     key,
    this.controller,
    this.type,
    this.onSubmit,
    this.onChange,
     required this.validator,
    this.label,
    this.prefix,
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
          contentPadding: const EdgeInsets.all(0),
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

