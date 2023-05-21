import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation/Features/Auth/presentation/views/login/widgets/login_options.dart';
import 'package:graduation/core/utils/assets.dart';
import '../../../../../../core/widgets/constants.dart';
import '../../../../../../core/widgets/text_field.dart';
import '../../../../../profile/presentation/views/profile_view.dart';
import '../../forgetPassword/forget_passwor_view.dart';
import '../../signup/sign_up.dart';


class LogInViewbody extends StatelessWidget {
  const LogInViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
      children:  [
        Image.asset(AssetsData.logo,fit:BoxFit.fill),
        const LoginItems(),
        const SizedBox(height: 10,),

        const CustomTextFormField(
          text: "Enter Your Email or Phone",
        ),

        const SizedBox(height: 20),

        const CustomTextFormField(
          text: "Password",
        ),

        TextButton(onPressed: () {
          Get.to(()=> const ForgetPasswordView() );
        },
          style:const ButtonStyle(
              alignment: Alignment.centerLeft),
          child: const Text("Forget your password ?",
          style:
          TextStyle(color:Colors.black26,),
          textAlign: TextAlign.left,) ),

        Center(
          child: ElevatedButton(onPressed:(){
            // Get.to(()=> ProfileView());
          },
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kSecColor)),
              child: const Text("Login",
                style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,),)),
        ),

        Center(
          child: TextButton(onPressed: () {
            Get.to(()=> const SignUpView() );
          },
              style:const ButtonStyle(
                  alignment: Alignment.centerLeft),
              child: const Text("Sign Up",
                style:
                TextStyle(color:Colors.black26,),
                textAlign: TextAlign.left,) ),
        ),


      ],
    );

  }
}
