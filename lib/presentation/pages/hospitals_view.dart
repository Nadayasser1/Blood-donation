import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/hospital_information.dart';
import 'bottom_appbar.dart';

class HospitalsView extends StatelessWidget{
  const HospitalsView({super.key,});





  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Hospitals"),
        leading: IconButton(
            onPressed: (){
              Get.to(() => const BottomNavbar() );
            },
            icon:const Icon(Icons.arrow_circle_left_outlined)),
        automaticallyImplyLeading:false,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child:
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height *0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height *0.8,
              child: ListView.separated(
                  itemBuilder: (context,i){
                    return
                       const HospitalInformation(
                        branchName: 'Ibn Sina Hospital',
                         state: 'A- is at healthy level.donation are still accepted',
                         phone: '01234567890',
                         city: 'Tanta',
                         location: '=======',
                      );
                  },
                  separatorBuilder: (BuildContext context, int index){
                    return const Divider(thickness: 1,);
                  },
                  itemCount: 10),
            )

          ],
        ),
      ),


    );
  }


}