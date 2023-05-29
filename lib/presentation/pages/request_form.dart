// import 'package:flutter/material.dart';
// import 'package:graduation/core/widgets/constants.dart';
// import '../../core/widgets/custom_buttons.dart';
// import '../../core/widgets/custom_text.dart';
// import '../../core/widgets/icons.dart';
//
//
//
// class RequestForm extends StatelessWidget{
//   const RequestForm({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: Container(
//         margin: const EdgeInsets.symmetric(vertical: 70,horizontal: 25),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: const [
//                 TopBarText(
//                     text: "Request Form",
//                 color: mainColor),
//                 NavigationIcon(
//                   color: Colors.black38,
//                   icon: Icons.arrow_circle_right_outlined,
//                 ),
//               ],),
//             const SizedBox(height: 10,),
//             const DataEntryfield(
//               label: "Patient Name",
//               text: "Full name",),
//             const SizedBox(height: 10,),
//             const DataEntryfield(
//               label:"Patient National Id" ,
//               inputType: TextInputType.number,
//               text: "**************",),
//             const SizedBox(height: 10,),
//
//             const DataEntryfield(
//               label:"Reason" ,
//               inputType: TextInputType.multiline,
//               text: "Write the reason",),
//
//
//           ],
//
//         ),
//       ),
//     );
//   }
//
//
// }