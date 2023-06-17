import 'package:flutter/material.dart';
import 'package:graduation/core/utils/assets.dart';
import '../../core/utils/constants.dart';
import '../widgets/user_cards.dart';
import '../widgets/user_info.dart';

class ProfileView extends StatelessWidget{
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
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
                      fontSize: 22)),
              leading:  CircleAvatar(
                maxRadius: 25,
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.red.withOpacity(0.5),
                backgroundImage: const AssetImage(AssetsData.avatar)
              ) ,
              trailing:  IconButton(onPressed: (){},
                  icon:const Icon( Icons.edit,
                    color:mainColor ,
                    size: 30,)),
            ),
            SizedBox(height: 30,),
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

            const SizedBox(height: 25),
            const ProfileCards(),
            const SizedBox(height: 50),
          ],
        ),),
    )


    ;
  }
  
}