
import 'package:flutter/material.dart';
import 'package:graduation/Features/Auth/presentation/views/signup/widgets/sign_up_body.dart';

class SignUpView extends StatelessWidget{
  const SignUpView({super.key});



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        physics: FixedExtentScrollPhysics(),
        child: SignUpBody()
        ,)
      ,
    );
  }

}