
import 'package:flutter/material.dart';
import '../widgets/login_view_body.dart';


class LogInView extends StatelessWidget {
  const LogInView({super.key});


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
      SingleChildScrollView(
        physics: FixedExtentScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical:50,horizontal: 30) ,
        child:LogInViewbody()
        ,)
    );
  }

}