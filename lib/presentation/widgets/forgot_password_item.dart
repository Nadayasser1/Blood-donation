import 'package:flutter/material.dart';
import 'package:graduation/core/utils/assets.dart';
import '../../core/utils/constants.dart';
import '../../core/widgets/custom_text.dart';
import '../../core/widgets/icons.dart';

class ForgotPasswordItems extends StatelessWidget{
  final String? label;
  final String? subtitle;
  const ForgotPasswordItems({super.key, this.label, this.subtitle});



  @override
  Widget build(BuildContext context) {
    return Column(
         children: [
           const SizedBox(height:70),
           Row(
             children:  const [
               NavigationIcon(
                 icon: Icons.arrow_circle_left_outlined,
                 color: kSecColor,),
               TopBarText(
                 text: "Forgot Password",
                 color: kSecColor,),

             ],
           ),
           const SizedBox(height:120),
           SizedBox(
             width: 150,
             height: 150,
             child: Image.asset(AssetsData.forgetpassword)),
            const SizedBox(height: 100,),
           const SizedBox(height:30),
           Text(label!,
            style: const TextStyle(color: kSecColor,fontSize: 20),),
           Text(subtitle!,
             style: const TextStyle(color: kSecColor,fontSize: 15),),
           const SizedBox(height:10),

         ],


    );
  }


}

