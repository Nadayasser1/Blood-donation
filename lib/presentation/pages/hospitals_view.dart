
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/core/utils/constants.dart';
import 'package:graduation/presentation/widgets/top_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../widgets/blood_ratio.dart';
import '../widgets/hospital_information.dart';
import 'bottom_appbar.dart';

class HospitalsView extends StatelessWidget{
  const HospitalsView({super.key});



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
             CustomTopBar(
              title: "Ibn Sina Hospital",
              icon: Icons.arrow_circle_right_outlined,
              onPressed: (){
                Get.to(() => const BottomNavbar());
              },
            ),
            const HospitalInformation(
              icon: Icons.phone_in_talk,
              text: '01144680000',
              subTitle: ""),
            const HospitalInformation(
                icon: Icons.location_on,
                text: "El-Gaish, Tanta Qism 2, Tanta,\n Gharbia Governorate",
                subTitle: ""),
            const HospitalInformation(
              icon: MdiIcons.water,
              text: 'Low blood stock',
              fontWeight: FontWeight.bold,
              subTitle: "A- need donation URGENTLY.",),
            SizedBox(height: MediaQuery.of(context).size.height *0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                BloodRatio(
                  bloodType: 'O+',
                  footer: 'Low',
                  percent: 0.2,
                ),
                BloodRatio(
                  bloodType: 'O-',
                  footer: 'full',
                  percent: 1,
                ),
                BloodRatio(
                  bloodType: 'B+',
                  footer: 'Medium',
                  percent: 0.5,
                ),
                BloodRatio(
                  bloodType: 'B-',
                  footer: 'Low',
                  percent: 0.3,
                )

              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height *0.08,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                BloodRatio(
                  bloodType: 'A+',
                  footer: 'Low',
                  percent: 0.2,
                ),
                BloodRatio(
                  bloodType: 'A-',
                  footer: 'full',
                  percent: 1,
                ),
                BloodRatio(
                  bloodType: 'AB+',
                  footer: 'Low',
                  percent: 0.2,
                ),
                BloodRatio(
                  bloodType: 'AB-',
                  footer: 'Low',
                  percent: 0.2,
                )

              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height *0.05,),
            Center(
              child: ElevatedButton(
                  onPressed: (){},
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kSecColor)),
                  child: const Text("Donate",
                    style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,),
                  )),
            )

          ],
        ),
      ),


    );
  }


}