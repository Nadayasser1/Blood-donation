
import 'package:flutter/material.dart';

import '../../../../../../core/widgets/constants.dart';
import '../../../../../../core/widgets/icons.dart';


class YourRequests extends StatelessWidget{

  const YourRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 70),
        child:Column(

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: kSecColor,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  width: 210,
                  height: 60,
                  alignment: Alignment.center,
                  child: const Text("Your Requests",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                      fontSize: 25)),
                ),
                NavigationIcon()
              ],
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
                  color: iconColor,
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
                    color: iconColor,
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
                    color: iconColor,
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
                    color: iconColor,
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
                    color: iconColor,
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