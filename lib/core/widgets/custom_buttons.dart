import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/core/widgets/custom_text.dart';
import 'constants.dart';

class MainButton extends StatelessWidget{
  const MainButton({super.key, this.text, this.onTap,});
final String? text;
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
  bool? obscureText;
  Function(String)? onChanged;

   CustomTextFormField({Key? key,
     this.obscureText =false,
     this.suffexIcon,
     this.onChanged,
      this.text,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        validator:(value) {
          if(value!.isEmpty){
            return "Enter your email/password";
          }
          return null;
        },
        obscureText: obscureText!,
        onChanged: onChanged,
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
