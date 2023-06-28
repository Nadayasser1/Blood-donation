// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:graduation/core/utils/assets.dart';
import 'package:graduation/presentation/controller/profile_cubit.dart';
import '../../core/functions/toast_message.dart';
import '../../core/services/services_locator.dart';
import '../../core/services/shared_preferences.dart';
import '../../core/utils/constants.dart';
import '../../domain/use_cases/user_profile_use_case.dart';
import '../widgets/user_cards.dart';
import '../widgets/user_info.dart';
import 'login_view.dart';

class ProfileView extends StatelessWidget {
   const ProfileView({super.key});

  @override
  Widget build(BuildContext context)  {
    final AppPreferences appPreferences=sl<AppPreferences>();
    final String id= appPreferences.getToken();
    print(id);
    BlocProvider.of<ProfileCubit>(context).getProfile((UserProfileParameters(id: id )));
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if(state is ProfileSuccessState){
          print(state.profileData.userProfileData.email);
          // print(state.profileData.userProfileData.email);
        }
        else if(state is ProfileErrorState){
          Toastmessage(context, state.error);
        }

      },

     builder: (context, state) {
        if(state is ProfileSuccessState){
          return Scaffold(
            appBar: AppBar(),
            body:  Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  ListTile(
                    title: Text(state.profileData.userProfileData.name,
                        style:const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    leading:  CircleAvatar(
                        maxRadius: 25,
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.red.withOpacity(0.5),
                        backgroundImage: const AssetImage(AssetsData.avatar)
                    ) ,
                    trailing:  TextButton(onPressed: ()async{
                      await appPreferences.setIsUserLoggedIn(false);
                      await appPreferences.getOut();
                      Get.off(()=>  LogInView());
                      //Navigator.of(context).pushReplacementNamed(Routes.login);
                    },
                      child: const Text("Log Out",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold
                          )),
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03),
                   UserInfo(
                    label: "Email",
                    labelSize: 20,
                    text: state.profileData.userProfileData.email,
                     textSize: 16,
                  ),
                  const Divider(thickness: 1,),
                   UserInfo(
                    label: "Phone",
                    labelSize: 20,
                    text: state.profileData.userProfileData.phone,
                     textSize: 16,
                  ),
                  const Divider(thickness: 1,),
                   UserInfo(
                    label: "National ID",
                    labelSize: 20,
                    text: state.profileData.userProfileData.id,
                     textSize: 16,
                  ),
                  const Divider(thickness: 1,),
                   UserInfo(
                    label: "Gender",
                    labelSize: 20,
                    text: state.profileData.userProfileData.gender,
                     textSize: 16,
                  ),
                  const Divider(thickness: 1,),
                   UserInfo(
                    label: "Date of birth",
                    labelSize: 20,
                    text: state.profileData.userProfileData.birthdate,
                     textSize: 16,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  const ProfileCards(),
                ],
              ),),);
        }

        else{ return const Center(child: CircularProgressIndicator());}

      },

    );
  }
  
}