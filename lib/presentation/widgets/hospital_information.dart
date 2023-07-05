import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/presentation/widgets/user_info.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../core/utils/constants.dart';
import '../pages/donation_questions.dart';

class HospitalInformation extends StatelessWidget{
  const HospitalInformation({super.key,
    required this.branchName,
    required this.state,
    required this.phone,
    required this.city,
    required this.location,});

  final String branchName;
  final String state;
  final String phone;
  final String city;
  final String location;



  @override
  Widget build(BuildContext context) {
    return Container(
          decoration:  BoxDecoration(
              // color: const Color(0x22B1B1B1),
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
                 leading: Icon(MdiIcons.hospitalBuilding),
                  title: Text(branchName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
                  subtitle: Text(state,
                  textAlign: TextAlign.center),
                ),
                 UserInfo(
                  label: "Phone:",
                  text: phone,
                ),
                 UserInfo(
                  label: "City:",
                  text: city,
                ),
                 UserInfo(
                  label: "Address:",
                  text: location,
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