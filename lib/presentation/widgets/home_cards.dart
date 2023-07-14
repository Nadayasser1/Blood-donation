import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/presentation/pages/hospitals_view.dart';
import 'package:graduation/presentation/pages/request_form.dart';
import 'package:graduation/presentation/pages/requests.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../core/utils/constants.dart';
import '../pages/donation_history.dart';
import '../pages/donation_questions.dart';





class AnimatedHomeContainer extends StatefulWidget {
  const AnimatedHomeContainer({super.key});

  @override
  State<AnimatedHomeContainer> createState() => _AnimatedHomeContainerState();
}



class _AnimatedHomeContainerState extends State<AnimatedHomeContainer> {

  double _width = 140;
  double _height = 140;
   Color  _color = cardsColor;

  double _width1 = 140;
  double _height1 = 140;
  Color  _color1 = cardsColor;


  double _width2 = 140;
  double _height2 = 140;
  Color  _color2 = cardsColor;



  double _width3 = 140;
  double _height3 = 140;
  Color  _color3 = cardsColor;


  double _width4 = 140;
  double _height4 = 140;
  Color  _color4 = cardsColor;



  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _width1 = 150;
                  _height1 = 150;
                  _color = Colors.blueGrey;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                onEnd:() {
                  setState(() {
                    _height1 = 140;
                    _width1 = 140;
                    _color = kSecColor;
                    Get.to(()=> RequestForm());
                  });
                },
                width: _width1,
                height: _height1,
                decoration:  BoxDecoration(
                    color: _color,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.person_search_rounded,
                      size: 50,
                      color: kPrimaryColor,),
                    Text("Find Blood",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),

                    )],
                ),),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _width4 = 150;
                  _height4 = 150;
                  _color1 = Colors.blueGrey;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                onEnd:() {
                  setState(() {
                    _height4 = 140;
                    _width4 = 140;
                    _color1 = kSecColor;
                    Get.to(()=>const YourRequests());
                  });
                },
                width: _width4,
                height: _height4,
                decoration:  BoxDecoration(
                    color: _color1,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.assignment,
                      size: 50,
                      color: kPrimaryColor,),
                    Text("Your Requests",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),

                    )],
                ),),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _width = 150;
                  _height = 150;
                  _color3 = Colors.blueGrey;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                onEnd:() {
                  setState(() {
                    _height = 140;
                    _width = 140;
                    _color2 = kSecColor;
                    Get.to(() => DonationQuestions());
                  });
                },
                width: _width,
                height: _height,
                decoration:  BoxDecoration(
                    color: _color3,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.handshake,
                      size: 50,
                      color: kPrimaryColor,),
                    Text("Donate",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),

                    )],
                ),),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _width3 = 150;
                  _height3 = 150;
                  _color4 = Colors.blueGrey;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                onEnd:() {
                  setState(() {
                    _height3 = 140;
                    _width3 = 140;
                    _color3 = kSecColor;
                    Get.to(()=>YourDonations());
                  });
                },
                width: _width3,
                height: _height3,
                decoration:  BoxDecoration(
                    color: _color4,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.document_scanner,
                      size: 50,
                      color: kPrimaryColor,),
                    Text("Donation Reports",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),

                    )],
                ),),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        InkWell(
          onTap: () {
            setState(() {
              _width2 = 150;
              _height2 = 150;
              _color2 = Colors.blueGrey;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            onEnd:() {
              setState(() {
                _height2 = 140;
                _width2 = 140;
                _color4 = kSecColor;
                Get.to(()=>const HospitalsView());
              });
            },
            width: _width2,
            height: _height2,
            decoration:  BoxDecoration(
                color: _color2,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(MdiIcons.hospitalBuilding,
                  size: 50,
                  color: kPrimaryColor,),
                Text("Hospitals",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),

                )],
            ),),
        ),


      ],
    );
  }
}

