// ignore_for_file: must_be_immutable
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:graduation/presentation/controller/register_cubit.dart';
import 'package:graduation/presentation/pages/login_view.dart';
import 'package:graduation/presentation/widgets/background.dart';
import 'package:group_button/group_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../core/functions/toast_message.dart';
import '../../core/services/services_locator.dart';
import '../../core/services/shared_preferences.dart';
import '../../core/utils/constants.dart';
import '../../core/widgets/custom_buttons.dart';
import '../../core/widgets/custom_progress_indecator.dart';
import '../../core/widgets/custom_text.dart';
import '../../core/widgets/date_picker.dart';
import '../../domain/use_cases/register_use_case.dart';
import '../widgets/appBar.dart';
import 'bottom_appbar.dart';


class SignUpView extends StatelessWidget{
   SignUpView({super.key});

  bool loading = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var idController = TextEditingController();
  var dateController = TextEditingController();
   String _gender="";
   GlobalKey<FormState> formState = GlobalKey();


  @override
  Widget build(BuildContext context) {
    final AppPreferences appPreferences=sl<AppPreferences>();
    final String token = appPreferences.getNotificationsToken();
    return BlocConsumer<RegisterCubit, RegisterState>(
     listener: (context, state) {
       if(state is RegisterSuccessState){
         appPreferences.setToken(state.registerData.userInfo.id);
         appPreferences.setIsUserLoggedIn(true);
         print(token);
         Get.off(()=> const BottomNavbar());
       }
       if(state is RegisterErrorState){
         Toastmessage(context, state.error,);
         print(state.error);
         print(token);
       }
      },
      builder: (context, state) {
      return Background(
        child: Scaffold(
          appBar: customAppBar(
            "Sign Up"
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formState,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height *0.01),
                    const TitleText(
                      size: 16,
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
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height *0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:  [
                        const TitleText(
                          size: 16,
                          label: "Gender",
                        ),
                        GroupButton(
                            maxSelected: 1,
                          enableDeselect: false,
                          options: GroupButtonOptions(
                              unselectedBorderColor: kSecColor,
                              selectedColor: kSecColor,
                              borderRadius: BorderRadius.circular(10),
                              buttonWidth: 90),
                            buttons: const ["Male","Female"],
                           onSelected: (value,index, isSelected){
                             if (value=="Male"){
                              _gender="1";}
                            else if (value=="Female"){
                              _gender="2";}
                           })
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height *0.01),
                    const TitleText(
                      size: 16,
                      label: "Date of Birth",
                    ),
                     CustomDatePicker(
                      controller: dateController,
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height *0.01),
                    const TitleText(
                      size: 16,
                      label: "Email",
                    ),
                    CustomTextField(
                      controller: emailController,
                      text: "Enter your email i.e example@.com",
                      prefix: Icons.email,
                      type: TextInputType.emailAddress,
                      validator: (value){
                        final trimmedEmail = value?.trim();
                        final emailCheck =RegExp(r'^\s*[\w-]+@([\w-]+\.)+[\w-]{2,4}\s*$');
                        if(value!.isEmpty){
                          return "Enter your email address";
                        }
                        else if(!emailCheck.hasMatch(trimmedEmail!)){
                          return "Please enter a valid email";
                        }
                        return null;},
                      ),
                    SizedBox(height: MediaQuery.of(context).size.height *0.01),
                    const TitleText(
                      size: 16,
                      label: "Password",
                    ),
                    CustomTextField(
                      controller: passwordController,
                      text: "********",
                      isPassword: RegisterCubit.get(context).isPassword,
                      suffix: RegisterCubit.get(context).suffixIcon,
                      suffixPress: BlocProvider.of<RegisterCubit>(context).registerPasswordShow,
                      prefix: Icons.key,
                      type: TextInputType.visiblePassword,
                      validator: (value){
                        final passCheck = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$#])[a-zA-Z\d@$#]{8,}$');
                        if(value!.isEmpty){
                          return "Enter your Password";
                        }
                         else if (value.length < 8) {
                          return 'Password must be at least 8 characters';}
                         else if (!passCheck.hasMatch(value)){
                           return "Your password must be strong";
                        }
                        return null;},
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height *0.01),
                    CustomTextField(
                      type:TextInputType.visiblePassword,
                      text: "Re-enter password",
                      isPassword: RegisterCubit.get(context).reEnterPassword,
                      prefix: Icons.key,
                      suffix: RegisterCubit.get(context).reSuffixIcon,
                      suffixPress: BlocProvider.of<RegisterCubit>(context).reEnterPasswordShow,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Re-enter your password";
                        }
                        else if(value != passwordController.text){
                          return "password don't match";
                        }
                        return null;},
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height *0.01),
                    const TitleText(
                      size: 16,
                      label: "Phone number",
                    ),
                    CustomTextField(
                      controller: phoneController,
                      text: "Enter your phone number",
                      prefix: Icons.phone,
                      type: TextInputType.number,
                      validator: (value){
                        final phoneCheck = RegExp(r'^[0-9]{11}$');
                        if(value!.isEmpty){
                          return "enter your phone number";
                        }
                        else if (!phoneCheck.hasMatch(value)){
                          return "Please enter a valid phone number";
                        }
                        return null;},
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height *0.01),
                    const TitleText(
                      size: 16,
                      label: "National ID",
                    ),
                    CustomTextField(
                      controller: idController,
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

                        return null;},

                    ),
                    Center(
                      child: ConditionalBuilder(
                        condition: state is! RegisterLoadingState,
                        builder:((context) =>
                            ElevatedButton(
                            onPressed: (){
                              print(token);
                              if(formState.currentState!.validate()){
                                BlocProvider.of<RegisterCubit>(context).register(
                                    RegisterParameters(
                                        idController.text,
                                        nameController.text,
                                        emailController.text,
                                        passwordController.text,
                                        phoneController.text,
                                        _gender,
                                        dateController.text,
                                        token,
                                        ));
                              }
                            },
                             style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kSecColor)),
                            child: const Text("Sign Up",
                               style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.bold,),
                            ))
                        ),
                        fallback: (context)=>const CustomProgressIndecator(),

                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          const TitleText(label:"Already have account ?",color:hintTextColor,size: 15,),
                          TextButton(onPressed: (){
                            Get.to(()=> LogInView());
                          },
                              child:const TitleText(label:"Sign In",color: Colors.blueAccent,size: 16,),)
                        ],
                      ),

                    // const Divider(thickness: 2,color: kSecColor,),
                    // const LoginItems(),

                  ],
                ),
              ),
            ),
          )

    ),
      );
  },
);
  }

}