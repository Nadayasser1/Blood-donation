import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../core/utils/assets.dart';
import '../widgets/custom_list_tile.dart';
import '../widgets/top_bar.dart';

class NotificationView extends StatelessWidget{
  const NotificationView ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
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
                const CustomListTile(
                  title:"Raslan Hospitals need A-" ,
                  subtitle: "If you have a time you can help",
                  icon: Icon(MdiIcons.hospitalBuilding,size: 40,color: Colors.black,),
                );
            },
            separatorBuilder: (BuildContext context, int index){
              return const Divider(thickness: 1,);
            },
            itemCount: 10)



      ),


    );
  }

}

