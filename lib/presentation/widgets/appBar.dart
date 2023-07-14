

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/utils/assets.dart';
import '../../core/utils/constants.dart';
import '../pages/bottom_appbar.dart';

AppBar customAppBar(String text) {
  return AppBar(
    backgroundColor: kSecColor,
    leading: Stack(
      children: [Positioned(
        top: 5,
        right: 0,
        left: 0,
        child: SizedBox(
          height: 60,
          width: 20,
          child: Image.asset(
            AssetsData.logo,
          ),
        ),
      )],
    ),
    title:  Text(text,style: const TextStyle(color: kPrimaryColor)),
    automaticallyImplyLeading:false,
  );
}

AppBar pageAppBar(String text){
  return  AppBar(
    backgroundColor: kSecColor,
    title:  Text(text,style: const TextStyle(color: kPrimaryColor),),
    leading: IconButton(
        onPressed: (){
          Get.to(() => const BottomNavbar() );
        },
        icon:const Icon(Icons.arrow_circle_left_outlined,color: kPrimaryColor,)),
    automaticallyImplyLeading:false,
  );
}