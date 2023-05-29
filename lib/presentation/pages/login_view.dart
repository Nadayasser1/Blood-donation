import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:graduation/core/utils/assets.dart';
import 'package:graduation/domain/use_cases/login_use_case.dart';
import 'package:graduation/presentation/pages/profile_view.dart';
import 'package:graduation/presentation/pages/sign_up.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../core/widgets/constants.dart';
import '../../core/widgets/custom_buttons.dart';
import '../controller/login_cubit.dart';
import '../widgets/login_options.dart';
import 'forget_password_view.dart';


class LogInView extends StatelessWidget {
  LogInView({super.key,});

  bool loading = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginSuccessState){
          Get.to(()=>const ProfileView());}
        else if(state is LoginErrorState){
          AwesomeSnackbarContent(
              title: "Error!",
              message: "something is wrong${state.error}",
              contentType:ContentType.failure);
        }

      },
      builder: (context, state) {
        return Scaffold(
            body:
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(AssetsData.logo, fit: BoxFit.fill),
                      const LoginItems(),
                      const SizedBox(height: 10,),
                      const SizedBox(height: 20),
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
                      const SizedBox(height: 20),

                      CustomTextField(
                          type: TextInputType.visiblePassword,
                          controller: passwordController,
                          validator: (value){
                            if(value!.isEmpty){
                              return "please enter your password";
                            }
                            return null;
                          },
                          prefix: MdiIcons.key,
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
                                    BlocProvider.of<LoginCubit>(context).login(LoginParameters(email: emailController.text, password: passwordController.text))
                                    ;
                                  }
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        kSecColor)),
                                child: const Text("Login",
                                  style: TextStyle(fontSize: 20,
                                    fontWeight: FontWeight.bold,),)),
                            fallback: (context)=>const CircularProgressIndicator(),
                          ),
                        ),

                      Center(
                        child: TextButton(onPressed: () {
                          Get.to(() => const SignUpView());
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
            )
        );
      },
    );
  }

}

