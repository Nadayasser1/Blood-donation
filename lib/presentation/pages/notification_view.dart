import 'package:flutter/material.dart';
import 'package:graduation/core/widgets/constants.dart';
import '../../core/widgets/custom_text.dart';
import '../widgets/custom_list_tile.dart';

class NotificationView extends StatelessWidget{
  const NotificationView ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(children:   [
         const Positioned(
            top: 70,
            left: 25,
            child: TopBarText(
              text: "Notifications",
            color: mainColor,)
        ),
        Positioned(
            top: 100,
            child:
            ListView.separated(
              itemCount: 6,
              itemBuilder: (context,i){
                return  const CustomListTile();
              },
              separatorBuilder: (BuildContext context, int index)
              {return const Divider(thickness: 1,);  },)
        )



      ],) ,
    );
  }

}

