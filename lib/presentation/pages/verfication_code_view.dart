
import 'package:flutter/material.dart';

import '../../core/widgets/constants.dart';
import '../../core/widgets/custom_buttons.dart';
import '../widgets/forgot_password_item.dart';

class VerificationPage extends StatelessWidget{
  const VerificationPage({super.key});



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
                  label: "Please enter your verification code",
                  subtitle: "We have send a verification code to your registered email",
                ),
                CustomTextField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "please enter verification code";
                    }
                    return null;
                  },
                  text:"123456" ,
                  prefix: Icons.numbers_outlined,),
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