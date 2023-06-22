import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation/presentation/pages/donate_now_view.dart';
import 'package:graduation/presentation/pages/donation_history.dart';
import 'package:graduation/presentation/pages/hospitals_view.dart';
import 'package:graduation/presentation/pages/request_form.dart';
import 'package:graduation/presentation/pages/requests.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../core/utils/constants.dart';



class HomeCards extends StatelessWidget{
  const HomeCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:50),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width *0.4,
                height: MediaQuery.of(context).size.height *0.18,
                decoration:  BoxDecoration(
                    color: cardsColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.handshake,
                      size: 50,
                      color: kPrimaryColor,),
                    TextButton(onPressed: (){
                      Get.to(()=>  const DonateNowView());
                    }, child:const Text("Donate",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),))
                  ],
                ),),
              Container(
                width: MediaQuery.of(context).size.width *0.4,
                height: MediaQuery.of(context).size.height *0.18,
                decoration:  BoxDecoration(
                    color: cardsColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.person_search_rounded,
                      size: 50,
                      color: kPrimaryColor,),
                    TextButton(onPressed: (){
                      Get.to(()=>   RequestForm());
                    }, child:const Text("Find Blood",
                      textAlign:TextAlign.center,
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),))
                  ],
                ),)

            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width *0.4,
                height: MediaQuery.of(context).size.height *0.18,
                decoration:  BoxDecoration(
                    color: cardsColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(MdiIcons.hospitalBuilding,
                      size: 50,
                      color: kPrimaryColor,),
                    TextButton(onPressed: (){
                      Get.to(()=>  const HospitalsView());
                    }, child:const Text("Hospitals",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),))
                  ],
                ),),
              Container(
                width: MediaQuery.of(context).size.width *0.4,
                height: MediaQuery.of(context).size.height *0.18,
                decoration:  BoxDecoration(
                    color: cardsColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(MdiIcons.carEmergency,
                      size: 50,
                      color: kPrimaryColor,),
                    TextButton(onPressed: (){}, child:const Text("Donation Caravans",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),))
                  ],
                ),)

            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width *0.4,
                height: MediaQuery.of(context).size.height *0.18,
                decoration:  BoxDecoration(
                    color: cardsColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.document_scanner,
                      size: 50,
                      color: kPrimaryColor,),
                    TextButton(onPressed: (){
                      Get.to(()=>  const YourDonations());
                    }, child:const Text("Donation Reports",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),))
                  ],
                ),),
              Container(
                width: MediaQuery.of(context).size.width *0.4,
                height: MediaQuery.of(context).size.height *0.18,
                decoration:  BoxDecoration(
                    color: cardsColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.assignment,
                      size: 50,
                      color: kPrimaryColor,),
                    TextButton(onPressed: (){
                      Get.to(()=>  const YourRequests());
                    }, child:const Text("Your Requests",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),))
                  ],
                ),)
            ],
          ),
        ],
      ) ,
    )
    ;
  }

}



