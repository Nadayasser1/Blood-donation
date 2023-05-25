import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:graduation/core/utils/assets.dart';
import 'package:graduation/domain/use_cases/login_use_case.dart';
import 'package:graduation/presentation/pages/profile_view.dart';
import 'package:graduation/presentation/pages/sign_up.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import '../../core/widgets/constants.dart';
import '../../core/widgets/custom_buttons.dart';
import '../controller/login_cubit.dart';
import '../widgets/login_options.dart';
import 'forget_password_view.dart';


class LogInView extends StatelessWidget {
      LogInView({super.key, this.email, this.password});

   bool loading = false;
  String? email, password ;
  GlobalKey<FormState> formState = GlobalKey();


      @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState){
          loading = true ;
        }
        else if (state is LoginSuccessState){
          Get.to(()=> const ProfileView() );
        }
        else if ( state is LoginErrorState){
          AwesomeSnackbarContent(
            title: 'Warning',
          message: "Something is wrong",
          contentType:ContentType.failure);

        }
      },

     builder: (context, state) {
     return ModalProgressHUD(
       inAsyncCall: loading,
       child: Scaffold(
        body:
        SingleChildScrollView(
          physics: const FixedExtentScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical:50,horizontal: 30) ,
          child: Form(
            key:formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children:  [
                Image.asset(AssetsData.logo,fit:BoxFit.fill),
                const LoginItems(),
                const SizedBox(height: 10,),

                CustomTextFormField(
                  message: "enter your email",
                  onChanged: (value){
                    email = value;
                  },
                  text: "Enter Your Email or Phone",
                ),

                const SizedBox(height: 20),

                CustomTextFormField(
                  message: "enter your password",
                  onChanged: (value){
                    password = value;

                  },
                  obscureText: true,
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
                  child: ElevatedButton(
                      onPressed:(){
                        if(formState.currentState!.validate()){
                          BlocProvider.of<LoginCubit>(context).loginUseCase(LoginParameters(email: email!, password: password!));
                        }
                        else{}
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
            ),
          )

          ,)
    ),
     );
  },
);
  }

}