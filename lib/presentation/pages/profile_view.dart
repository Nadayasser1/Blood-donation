import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/core/utils/assets.dart';
import '../../core/services/services_locator.dart';
import '../../core/services/shared_preferences.dart';
import '../../core/utils/constants.dart';
import '../widgets/user_cards.dart';
import '../widgets/user_info.dart';
import 'login_view.dart';

class ProfileView extends StatelessWidget{
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppPreferences appPreferences=sl<AppPreferences>();
    return Scaffold(
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
               print(appPreferences.getToken());
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
        ),),
    )


    ;
  }
  
}