import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../core/widgets/constants.dart';
import '../../core/widgets/custom_buttons.dart';
import '../../core/widgets/custom_text.dart';
import '../widgets/login_options.dart';


class SignUpView extends StatelessWidget{
   SignUpView({super.key});

  bool loading = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var nationalIdController = TextEditingController();
   GlobalKey<FormState> formState = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
///dddddddddddddddddddddddd
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
            child: Form(
              key: formState,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleText(
                    label: "Name",
                  ),
                  CustomTextField(
                    controller: nameController,
                    text: "i.e Hesham Mohsen",
                    prefix: Icons.person,
                    type: TextInputType.name,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter your name";
                      }
                      return null;
                    },),
                  const SizedBox(height:20),
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
                  const TitleText(
                    label: "Email",
                  ),
                  CustomTextField(
                    controller: emailController,
                    text: "Enter your email i.e example@.com",
                    prefix: Icons.email,
                    type: TextInputType.emailAddress,
                    validator: (value){
                      final emailCheck =RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if(value!.isEmpty){
                        return "Enter your email address";
                      }
                      else if(!emailCheck.hasMatch(value)){
                        return "Please enter a valid email";

                      }
                      return null;
                    },),
                  const SizedBox(height: 10),
                  const TitleText(
                    label: "Password",
                  ),
                  CustomTextField(
                    controller: passwordController,
                    text: "********",
                    prefix: Icons.key,
                    suffix: Icons.remove_red_eye_outlined ,
                    type: TextInputType.number,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter your Password";
                      }
                       else if (value.length < 8) {
                        return 'Password must be at least 8 characters';}

                      return null;}),
                  const SizedBox(height: 10),
                  CustomTextField(
                    text: "Re-enter password",
                    prefix: Icons.key,
                    suffix: Icons.remove_red_eye_outlined ,
                    type: TextInputType.number,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Re-enter your password";
                      }
                      else if(value != passwordController.text){
                        return "password don't match";
                      }
                      return null;
                    },),
                  const SizedBox(height: 10),
                  const TitleText(
                    label: "Phone number",
                  ),
                  CustomTextField(
                    text: "Enter your phone number",
                    prefix: Icons.phone,
                    type: TextInputType.number,
                    validator: (value){
                      final phoneCheck = RegExp(r'^[0-9]{10}$');
                      if(value!.isEmpty){
                        return "enter your phone number";
                      }
                      else if (!phoneCheck.hasMatch(value)){
                        return "Please enter a valid phone number";
                      }
                      return null;
                    },),
                  const SizedBox(height: 10),
                  const TitleText(
                    label: "National ID",
                  ),
                  CustomTextField(
                    controller: nationalIdController,
                    text: "Enter your national ID number",
                    prefix: MdiIcons.idCard,
                    type: TextInputType.number,
                    validator: (value){
                      final idCheck = RegExp(r'^[0-9]{14}$');
                      if(value!.isEmpty){
                        return "enter your National ID";
                      }
                      else if (!idCheck.hasMatch(value)) {
                        return 'Please enter a valid Id number';
                      }

                      return null;
                    },),
                  const SizedBox(height: 5),
                  Center(
                    child: ElevatedButton(onPressed:(){},
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kSecColor)),
                        child: const Text("Sign Up",
                          style: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.bold,),)),
                  ),
                  Center(
                    child: TextButton(onPressed: () {  },
                        style:const ButtonStyle(
                            alignment: Alignment.centerLeft),
                        child: const Text("Already have account ? SigIn ",
                          style:
                          TextStyle(color:Colors.black26,),
                          textAlign: TextAlign.left,) ),
                  ),
                  const Divider(thickness: 2,color: kSecColor,),
                  const LoginItems(),

                ],
              ),
            ),
          ),
        )

    );
  }

}