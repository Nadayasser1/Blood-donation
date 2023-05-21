
import 'package:flutter/material.dart';
import 'package:graduation/presentation/widgets/profile_buttons.dart';
import 'package:graduation/presentation/widgets/user_cards.dart';
import 'package:graduation/presentation/widgets/user_info.dart';
import '../../../../../core/widgets/constants.dart';

class ProfileViewbody extends StatelessWidget{
  const ProfileViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  color:iconColor ,
                  size: 30,))
          ],
        ),
        const UserInfo(),
        SizedBox(height: 30),
        const ProfileCards(),
        SizedBox(height: 50),
        const EndButtons()
      ],
    ),)
    ;
  }


}