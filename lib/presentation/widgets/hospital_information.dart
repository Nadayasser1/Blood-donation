import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/presentation/widgets/user_info.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/utils/constants.dart';
import '../pages/donation_questions.dart';

class HospitalInformation extends StatelessWidget{
  const HospitalInformation({super.key,
    required this.branchName,
    required this.state,
    required this.phone,
    required this.city,
    this.address, });

  final String branchName;
  final String state;
  final String phone;
  final String city;
  final Widget? address;



  @override
  Widget build(BuildContext context) {
    return Container(
          decoration:  BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(5)) ,
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height * 0.32,
          child: SizedBox(
            height: double.minPositive,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                 ListTile(
                  minLeadingWidth: 0,
                 minVerticalPadding: 0,
                 horizontalTitleGap: 0,
                 leading: const Icon(MdiIcons.hospitalBuilding,color: Colors.black,),
                  title: Text(branchName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
                  subtitle: Text(state,
                  textAlign: TextAlign.center,
                    style: const TextStyle(color: kSecColor),
                  ),
                ),
                 UserInfo(
                   margin: const EdgeInsets.all(10),
                  label: "Phone:",
                  text: phone,
                ),
                 UserInfo(
                   margin: const EdgeInsets.all(10),
                   label: "City:",
                  text: city,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children:  [
                         const Text("Address:",
                             style:  TextStyle(
                                 fontWeight: FontWeight.bold,
                             )),
                         address!
                       ],
                     ),
                ),
                ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(kSecColor),),
                    onPressed: (){
                      Get.to(() =>   DonationQuestions());
                    },
                    child:const Text("Donate",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12),) ),




              ],
            ),
          ),
        );
  }

}




//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child:
//         RichText(
//           text: TextSpan(
//             text: 'Click here to visit our website',
//             style: const TextStyle(color: Colors.black),
//             recognizer: TapGestureRecognizer()
//               ..onTap = () {
//                 _launchURL(Uri.parse('https://www.example.com'));
//               },
//           ),
//         ),
//       ),
//     );
//   }
//
//   _launchURL(Uri url) async {
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }
