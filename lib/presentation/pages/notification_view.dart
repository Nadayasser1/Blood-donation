import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/constants.dart';
import '../widgets/custom_list_tile.dart';

class NotificationView extends StatelessWidget{
  const NotificationView ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: appbarColor,
        title: const Text("Notifications"),
        leading: Stack(
          children: [Positioned(
            top: 5,
            right: 0,
            left: 0,
            child: SizedBox(
              height: 60,
              width: 20,
              child: Image.asset(
                AssetsData.logo,
              ),
            ),
          )],
        ),
        automaticallyImplyLeading:false,
      ),
      body: Container(

          margin : const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemBuilder: (context,i){
              return
                Container(
                  decoration: const BoxDecoration(
                      color:   Color(0x47B1B1B1),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child:  CustomListTile(
                    title:"Raslan Hospitals need A-" ,
                    subtitle: "If you have a time you can help",
                    icon: CircleAvatar(

                      maxRadius: 20,
                      child: Image.asset(

                          AssetsData.logo,
                          fit:BoxFit.fill),

                    ),
                  ),
                );
            },
            separatorBuilder: (BuildContext context, int index){
              return const Divider(thickness: 0,);
            },
            itemCount: 10)



      ),


    );
  }

}

