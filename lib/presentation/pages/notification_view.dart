import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../widgets/custom_list_tile.dart';
import '../widgets/top_bar.dart';

class NotificationView extends StatelessWidget{
  const NotificationView ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60,horizontal: 20),
        child:
        Column(
          children: [
            const CustomTopBar(
              title: "Notifications",),
            SizedBox(
              height: MediaQuery.of(context).size.height *0.65,
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
                  itemCount: 6),
            )

          ],
        ),
      ),


    );
  }

}

