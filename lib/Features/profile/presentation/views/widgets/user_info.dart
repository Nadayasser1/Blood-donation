
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget{
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Phone",
              style: TextStyle(
                fontSize: 20
              ),),
              Text("0101234567")
            ],
          ),
          // Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: const [
          //       Text("National ID",
          //           style: TextStyle(
          //               fontSize: 20
          //           )),
          //       Text("31746289375983")
          //     ]
          // ),
          const Divider(thickness: 1,),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Gender",
                    style: TextStyle(
                        fontSize: 20
                    )),
                Text("Male")
              ]
          ),
          const Divider(thickness: 1,),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Date of birth",
                    style: TextStyle(
                        fontSize: 20
                    )),
                Text("15/10/1985")
              ]
          ),
        ],
      ),
    );
  }


}