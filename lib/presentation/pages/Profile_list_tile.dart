import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget{
  const ProfileListTile({super.key,
    required this.userName,
    required this.onPressed,
    required this.email,
    required this.onTap});

  final String userName;
  final String email;
  final void Function() onPressed;
  final void Function() onTap;



  @override
  Widget build(BuildContext context) {
    return  ListTile(
      minLeadingWidth: 0,
      horizontalTitleGap: 10,
      title: Text(userName,
          style:const TextStyle(
            color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24)),
      subtitle: Text(email,style: const TextStyle(fontSize: 14)),
      leading:
      const CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white,
        child: Icon(Icons.person_outline_rounded),
      ),
      trailing:  SizedBox(
        width: MediaQuery.of(context).size.width*0.25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,

          children: [
            TextButton(onPressed: onPressed,
              child: const Text("Log Out",
                  style: TextStyle(

                    decoration: TextDecoration.underline,
                    fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  )),
            ),
             InkWell(
              onTap: onTap ,
                child: const Icon(
                    Icons.logout,
                    size: 15,)),
          ],
        ),
      ),
    );

  }



}