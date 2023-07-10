// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:graduation/core/utils/constants.dart';
import 'package:graduation/presentation/controller/profile_cubit.dart';
import 'package:graduation/presentation/pages/Profile_list_tile.dart';
import '../../core/functions/toast_message.dart';
import '../../core/services/services_locator.dart';
import '../../core/services/shared_preferences.dart';
import '../../core/widgets/custom_progress_indecator.dart';
import '../../domain/use_cases/user_profile_use_case.dart';
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
            appBar:
            AppBar(
              elevation: 0,
              toolbarHeight: MediaQuery.of(context).size.height *0.1,
              backgroundColor: kSecColor,
              centerTitle: true,
              title: const Text(
                'Profile',
                style:
                TextStyle(
                    fontSize: 17,
                    color: Colors.white, letterSpacing: 0.53),
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20)
                )
              ),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(150.0),
                  child: Container(
                    padding: const EdgeInsets.only(left: 0, bottom: 20),
                    child: ProfileListTile(
                      userName: state.profileData.userProfileData.name,
                      email: state.profileData.userProfileData.email,
                      onPressed:() async{
                      await appPreferences.setIsUserLoggedIn(false);
                      await appPreferences.getOut();
                      Get.off(()=>  LogInView());
                    //Navigator.of(context).pushReplacementNamed(Routes.login);
                    },
                        onTap:()async{
                          await appPreferences.setIsUserLoggedIn(false);
                          await appPreferences.getOut();
                          Get.off(()=>  LogInView());
                          //Navigator.of(context).pushReplacementNamed(Routes.login);
                        },
                    )
                  )),


            ),
            body:  Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15)
                )
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03),
                   UserInfo(
                     margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                    label: "Phone",
                    labelSize: 20,
                    text: state.profileData.userProfileData.phone,
                     textSize: 16,
                  ),
                  const Divider(thickness: 1,),
                   UserInfo(
                     margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                     label: "National ID",
                    labelSize: 20,
                    text: state.profileData.userProfileData.id,
                     textSize: 16,
                  ),
                  const Divider(thickness: 1,),
                   UserInfo(
                     margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                     label: "Gender",
                    labelSize: 20,
                    text: state.profileData.userProfileData.gender,
                     textSize: 16,
                  ),
                  const Divider(thickness: 1,),
                   UserInfo(
                     margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                     label: "Date of birth",
                     labelSize: 20,
                    text: state.profileData.userProfileData.birthdate,
                     textSize: 16,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ],
              ),),);
        }

        else{ return const Center(child: CustomProgressIndecator());}

      },

    );
  }
  
}