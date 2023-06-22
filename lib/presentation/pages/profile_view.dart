// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
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
   ProfileView({super.key});
  bool isLoading = false;

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
          // final AppPreferences appPreferences=sl<AppPreferences>();
          // appPreferences.setToken(state.profileData.userProfileData.id);

        }
        else if(state is ProfileErrorState){
          Toastmessage(context, state.error, Colors.red);
        }

      },

     builder: (context, state) {
      return ConditionalBuilder(
        condition: state is ProfileLoadingState,
        builder:(context) =>const Center(child:  CircularProgressIndicator()),
        fallback: (context)=>Scaffold(
          appBar: AppBar(
              backgroundColor: kPrimaryColor,
              elevation: 0),
          body:  Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                ListTile(
                  title:const Text("Hesham Mohsen",
                      style:TextStyle(
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
                const UserInfo(
                  label: "Email",
                  text: "HeshamMohsen@gmail.com",
                ),
                const Divider(thickness: 1,),
                const UserInfo(
                  label: "Phone",
                  text: "0101234567",
                ),
                const Divider(thickness: 1,),
                const UserInfo(
                  label: "National ID",
                  text: "30001234567891",
                ),
                const Divider(thickness: 1,),
                const UserInfo(
                  label: "Gender",
                  text: "male",
                ),
                const Divider(thickness: 1,),
                const UserInfo(
                  label: "Date of birth",
                  text: "15/10/1985",
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                const ProfileCards(),
              ],
            ),),),
      );


      },

    )


    ;
  }
  
}