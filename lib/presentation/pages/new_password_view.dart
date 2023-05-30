//
//
// import 'package:flutter/material.dart';
//
// import '../../core/widgets/constants.dart';
// import '../../core/widgets/custom_buttons.dart';
// import '../widgets/forgot_password_item.dart';
//
// class NewPasswordPage extends StatelessWidget{
//   const NewPasswordPage({super.key});
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body:Container(
//           padding: const EdgeInsets.all(10),
//           child:SingleChildScrollView(
//             physics: const FixedExtentScrollPhysics(),
//             child: Column(
//               children: [
//                 const ForgotPasswordItems(
//                   label: "Please enter a new password",
//                 ),
//                 CustomTextField(
//                   validator: (value){
//                     if(value!.isEmpty){
//                       return "please enter a new password";
//                     }
//                     return null;
//                   },
//                   text:"New password" ,
//                   prefix: Icons.numbers_outlined,),
//                 CustomTextField(
//                   validator: (value){
//                     if(value!.isEmpty){
//                       return "please re-enter password";
//                     }
//                     return null;
//                   },
//                   text:"Re-enter password" ,
//                   prefix: Icons.numbers_outlined,),
//
//                 const SizedBox(height: 20,),
//                 ElevatedButton(onPressed:(){},
//                     style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kSecColor)),
//                     child: const Text("Next",
//                       style: TextStyle(fontSize: 20,
//                         fontWeight: FontWeight.bold,),))
//
//
//
//               ],
//             ),
//           ) ,
//
//         )
//
//     );
//
//   }
//
//
// }
//
