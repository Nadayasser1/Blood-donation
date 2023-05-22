import 'package:flutter/material.dart';
import '../../../../../../core/widgets/constants.dart';
import '../../../../../../core/widgets/custom_buttons.dart';
import '../../../../../../core/widgets/custom_text.dart';
import 'login_options.dart';

class SignUpBody extends StatelessWidget{
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 70),
      child: Column(
        children: [
          const SizedBox(height:20),
          const DataEntryfield(
            label: "Full Name",
            inputType: TextInputType.name,
            text: "Your name",
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const TitleText(
                label: "Gender",
              ),
              MainButton(
                onTap: () {},
                text: "Male",
              ),
              MainButton(onTap: (){},text: "Female",)
            ],
          ),
          const SizedBox(height: 10),
          const DataEntryfield(
            label: "Email",
            inputType: TextInputType.emailAddress,
            text: "Enter Your Email",
          ),
          const SizedBox(height: 5),
          const DataEntryfield(
            label: "Phone number",
            text: "Enter Your Phone number ",
          ),
          const SizedBox(height: 5),
          const DataEntryfield(
            label: "Password",
            text: "********",
          ),
          const SizedBox(height: 5),
          const CustomTextFormField(
            text: "Confirm Password",
          ),
          const SizedBox(height: 5),
          ElevatedButton(onPressed:(){},
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kSecColor)),
                child: const Text("Sign Up",
                  style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,),)),
          TextButton(onPressed: () {  },
              style:const ButtonStyle(
                  alignment: Alignment.centerLeft),
              child: const Text("Already have account ? SigIn ",
                style:
                TextStyle(color:Colors.black26,),
                textAlign: TextAlign.left,) ),
          Divider(thickness: 2,color: kSecColor,),
          const LoginItems(),
        ],
      ),
    );
  }
  
  
}