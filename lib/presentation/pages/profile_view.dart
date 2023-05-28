import 'package:flutter/material.dart';
import 'package:graduation/core/widgets/constants.dart';
import '../widgets/profile_buttons.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: const [
                  Text("Hesham Mohsen",
                      style:TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                  Text("Hesham@Gmail.com",
                      style:TextStyle(
                          color: Colors.black12,
                          fontSize: 20))
                ],),
                IconButton(onPressed: (){},
                    icon:const Icon( Icons.edit,
                      color:mainColor ,
                      size: 30,))
              ],
            ),
            const UserInfo(
              label: "Phone",
              text: "0101234567",
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
            const EndButtons()
          ],
        ),),
    )


    ;
  }
  
}