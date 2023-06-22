import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../../core/widgets/icons.dart';
import '../../core/utils/constants.dart';
import '../widgets/top_bar.dart';
import 'bottom_appbar.dart';


class YourRequests extends StatelessWidget{

  const YourRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 70),
        child:Column(

          children: [
            CustomTopBar(
              title: "Request Form",
              icon: Icons.arrow_circle_right_outlined,
              onPressed: () {
                Get.to(() => const BottomNavbar());
              },
              iconColor: Colors.black38,
            ),
            const Divider(thickness: 2,),
            const ListTile(
              title: Text("Time",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              leading: Text("Report",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
              trailing: Text("State",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
            ),
            ListTile(
              style: ListTileStyle.list,
              title: const Text("18/2/2023",textAlign: TextAlign.center,) ,
              subtitle: const Text("18:23",textAlign: TextAlign.center,),
              leading:
              IconButton(onPressed: (){},
                  alignment: Alignment.topLeft,
                  color: mainColor,
                  iconSize: 30,
                  icon: const Icon(Icons.download_for_offline,)),
              trailing:const Icon(
                Icons.cancel_rounded,
                size: 25,
                color: Colors.red,)
                ),
            ListTile(
                style: ListTileStyle.list,
                title: const Text("18/2/2023",textAlign: TextAlign.center) ,
                subtitle: const Text("18:23",textAlign: TextAlign.center,),
                leading:
                IconButton(onPressed: (){},
                    alignment: Alignment.topLeft,
                    color: mainColor,
                    iconSize: 30,
                    icon: const Icon(Icons.download_for_offline,)),
                trailing:const Icon(
                  Icons.check_circle_rounded,
                  size: 25,
                  color: Colors.green,)
            ),
            ListTile(
                style: ListTileStyle.list,
                title: const Text("18/2/2023",textAlign: TextAlign.center) ,
                subtitle: const Text("18:23",textAlign: TextAlign.center,),
                leading:
                IconButton(onPressed: (){},
                    alignment: Alignment.topLeft,
                    color: mainColor,
                    iconSize: 30,
                    icon: const Icon(Icons.download_for_offline,)),
                trailing:const Icon(
                  Icons.check_circle_rounded,
                  size: 25,
                  color: Colors.green,)
            ),
            ListTile(
                style: ListTileStyle.list,
                title: const Text("18/2/2023",textAlign: TextAlign.center) ,
                subtitle: const Text("18:23",textAlign: TextAlign.center,),
                leading:
                IconButton(onPressed: (){},
                    alignment: Alignment.topLeft,
                    color: mainColor,
                    iconSize: 30,
                    icon: const Icon(Icons.download_for_offline,)),
                trailing:const Icon(
                  Icons.cancel_rounded,
                  size: 25,
                  color: Colors.red,)
            ),
            ListTile(
                style: ListTileStyle.list,
                title: const Text("18/2/2023",textAlign: TextAlign.center) ,
                subtitle: const Text("18:23",textAlign: TextAlign.center,),
                leading:
                IconButton(onPressed: (){},
                    alignment: Alignment.topLeft,
                    color: mainColor,
                    iconSize: 30,
                    icon: const Icon(Icons.download_for_offline,)),
                trailing:const Icon(
                  Icons.cancel_rounded,
                  size: 25,
                  color: Colors.red,)
            ),
          ],
        ),
      ),
    );
  }


}