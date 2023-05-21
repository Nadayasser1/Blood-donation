import 'package:flutter/material.dart';
import 'package:graduation/core/widgets/constants.dart';
import '../widgets/profile_body.dart';

class ProfileView extends StatelessWidget{
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0),
      body: const ProfileViewbody(),
    )


    ;
  }
  
}