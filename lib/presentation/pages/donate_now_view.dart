import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/core/utils/constants.dart';
import 'package:graduation/presentation/widgets/top_bar.dart';

import '../widgets/custom_list_tile.dart';
import 'bottom_appbar.dart';
import 'donation_form.dart';

class DonateNowView extends StatelessWidget{
  const DonateNowView({super.key});



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child:
        Column(
          children: [
            CustomTopBar(
              title: "Donate Now",
              icon: Icons.arrow_circle_right_outlined,
              onPressed: () {
                Get.to(() => const BottomNavbar());
              },
              iconColor: Colors.black38,),

           SizedBox(
             height: MediaQuery.of(context).size.height *0.8,
             child: ListView.separated(
                scrollDirection: Axis.vertical,
                  itemBuilder: (context,i){
                    return
                      CustomListTile(
                      title:"Ibn Sina hospital" ,
                      subtitle: "Low a blood stock \n A- need donation URGENTLY",
                      icon: const Icon(Icons.bloodtype,size: 40,color: Colors.black,),
                        trailing:
                        ElevatedButton(
                          style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(kSecColor)),
                          onPressed: (){
                            Get.to(() => const DonationForm());
                          },
                          child:const Text("Donate") ),
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