
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'custom_list_tile.dart';

class NotificationBody extends StatelessWidget{
  const NotificationBody({super.key});


  @override
  Widget build(BuildContext context) {
    return Stack(children:   [
      const Positioned(
          top: 70,
          left: 25,
          child: TopBarText(text: "Notifications",)
      ),
      Positioned(
        top: 100,
          child:
      ListView.separated(
        itemCount: 10,
        itemBuilder: (context,i){
          return  const CustomListTile();
        },
        separatorBuilder: (BuildContext context, int index)
        {return const Divider(thickness: 1,);  },)
      )



    ],);
  }


}