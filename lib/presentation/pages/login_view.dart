// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:graduation/core/functions/toast_message.dart';
import 'package:graduation/core/utils/assets.dart';
import 'package:graduation/domain/use_cases/login_use_case.dart';
import 'package:graduation/presentation/pages/sign_up.dart';
import 'package:graduation/presentation/widgets/appBar.dart';
import 'package:graduation/presentation/widgets/background.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../core/services/services_locator.dart';
import '../../core/services/shared_preferences.dart';
import '../../core/utils/constants.dart';
import '../../core/widgets/custom_buttons.dart';
import '../../core/widgets/custom_progress_indecator.dart';
import '../controller/login_cubit.dart';
import 'bottom_appbar.dart';
import 'forget_password_view.dart';


class LogInView extends StatelessWidget {
  LogInView({super.key,});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginSuccessState){
          final AppPreferences appPreferences=sl<AppPreferences>();
          appPreferences.setIsUserLoggedIn(true);
          appPreferences.setToken(state.loginData.user.id);
          Get.off(()=> const BottomNavbar());
          //Navigator.of(context).pushReplacementNamed(Routes.home);
        }
        else if(state is LoginErrorState){
          Toastmessage(context, state.error,);
        }

      },
      builder: (context, state) {
        return Background(
          child: Scaffold(
            appBar: (
            customAppBar("Log In")
              
            ),
              body:
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formState,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox.square(
                          dimension: 350,
                            child:Stack(
                                children: [
                                Positioned(
                                  left: MediaQuery.of(context).size.width *0.05,
                                  right: MediaQuery.of(context).size.width *0.05,
                                  top: MediaQuery.of(context).size.height *0.1,
                                  child: Image.asset(
                                      AssetsData.logo,
                                      fit: BoxFit.fill),
                                ),
                                   Positioned(
                                    left: MediaQuery.of(context).size.width *0.21,
                                    top: MediaQuery.of(context).size.height *0.28,
                                    child: const Text("LifeLine",style: TextStyle(
                                        fontSize: 45,
                                        fontWeight: FontWeight.bold,color: Color(
                                        0xFFB70000)),),
                                  ),
                                  Positioned(
                                    left: MediaQuery.of(context).size.width *0.2,
                                    top: MediaQuery.of(context).size.height *0.35,
                                    child: const Text("BLOOD BANK COMMUNITY",style: TextStyle(
                                        fontWeight: FontWeight.bold)),
                                  ),
                                ])),
                        CustomTextField(
                            type: TextInputType.emailAddress,
                            controller: emailController,
                            validator: (value){
                              if(value!.isEmpty){
                                return "please enter your email";
                              }
                              return null;
                            },
                            prefix: MdiIcons.email,
                            label: "Email",
                            text: "Enter your email",
                             onSubmit:(value){
                              if(formState.currentState!.validate()){
                               LoginCubit.get(context).login(LoginParameters(email: emailController.text, password: passwordController.text));
                            } }),
                        SizedBox(height: MediaQuery.of(context).size.height *0.02),
                        CustomTextField(
                            type: TextInputType.visiblePassword,
                            controller: passwordController,
                            validator: (value){
                              if(value!.isEmpty){
                                return "please enter your password";
                              }
                              return null;
                            },
                            prefix:Icons.key,
                            suffix: LoginCubit.get(context).suffixIcon,
                            suffixPress: BlocProvider.of<LoginCubit>(context).loginPasswordShow,
                            label: "Password",
                            text: "Enter your password",
                             isPassword: LoginCubit.get(context).isPassword,
                            onSubmit:(value){
                              if(formState.currentState!.validate()){
                                LoginCubit.get(context).login(LoginParameters(email: emailController.text, password: passwordController.text));
                            } }),


                        TextButton(onPressed: () {
                          Get.to(() => const ForgetPasswordView());
                        },
                            style: const ButtonStyle(
                                alignment: Alignment.centerLeft),
                            child: const Text("Forget your password ?",
                              style:
                              TextStyle(color: Colors.black26,),
                              textAlign: TextAlign.left,)),

                        Center(
                            child:ConditionalBuilder(
                              condition: state is! LoginLoadingState,
                              builder: (context)=>ElevatedButton(
                                  onPressed: () {
                                    if (formState.currentState!.validate()) {
                                      BlocProvider.of<LoginCubit>(context).login(LoginParameters(
                                          email: emailController.text.trim(),
                                          password: passwordController.text))
                                      ;
                                    }
                                  },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          kSecColor)),
                                  child: const Text("Login",
                                    style: TextStyle(fontSize: 20,
                                      fontWeight: FontWeight.bold,),)),
                              fallback: (context)=> const CustomProgressIndecator()
                            ),
                          ),

                        Center(
                          child: TextButton(onPressed: () {
                            Get.to(()=>  SignUpView(),);
                          },
                              style: const ButtonStyle(
                                  alignment: Alignment.centerLeft),
                              child: const Text("Sign Up",
                                style:
                                TextStyle(color: Colors.black26,),
                                textAlign: TextAlign.left,)),
                        ),
                      ],
                    ),
                  ),
                ),

              ) ),
        );
      },
    );
  }

}

