import 'package:flutter/material.dart';
import 'package:graduation/presentation/widgets/forgot_password_item.dart';
import '../../core/utils/constants.dart';
import '../../core/widgets/custom_buttons.dart';

class ForgetPasswordView extends StatelessWidget{
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(
        padding: const EdgeInsets.all(10),
        child:SingleChildScrollView(
          physics: const FixedExtentScrollPhysics(),
          child: Column(
             children: [
               const ForgotPasswordItems(
                 label: "Please enter your register email",
               ),
               CustomTextField(
                 label: "ddd",
                 validator: (value){
                   if(value!.isEmpty){
                     return "please enter your email";
                   }
                   return null;
                 },
                 text:"example@gmail.com" ,
                 prefix: Icons.mail_outline,
                 onSubmit: (String value) {  },),
               const SizedBox(height: 20,),
               ElevatedButton(onPressed:(){},
                   style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kSecColor)),
                   child: const Text("Next",
                     style: TextStyle(fontSize: 20,
                       fontWeight: FontWeight.bold,),))



             ],
          ),
        ) ,

      )

      );


  }


}