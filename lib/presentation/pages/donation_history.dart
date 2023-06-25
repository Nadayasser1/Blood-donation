import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/utils/constants.dart';
import '../widgets/top_bar.dart';
import 'bottom_appbar.dart';


class YourDonations extends StatelessWidget{
  const YourDonations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70,horizontal: 20),
        child: Column(
          children: [
            CustomTopBar(
              title: "Your donations",
              icon: Icons.arrow_circle_right_outlined,
              onPressed: () {
                Get.to(() => const BottomNavbar());
              },
              iconColor: Colors.black38,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                            color: cardsColor,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(Icons.local_hospital,size: 50,),
                            Text("live Saved"),
                            Text("30")
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                            color: cardsColor,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(Icons.bloodtype,size: 50,),
                            Text("Blood Type"),
                            Text("A-")
                          ],
                        ),

                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                            color: cardsColor,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(Icons.calendar_month,size: 50,),
                            Text("Last Donation"),
                            Text("24/5/2022")
                          ],
                        ),

                      )
                    ],
                  ),
                  const ListTile(
                    title: Text("Time",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    leading: Text("Report",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                    trailing: Text("Place",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                  ),

                  // CustomListTile(
                  //   title: ,
                  //   subtitle: ,
                  //   icon: ,
                  //   trailing: ,
                  // )

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
                    trailing: const Text("Ibn Sina"),
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
                    trailing: const Text("Ibn Sina"),
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
                    trailing: const Text("Ibn Sina"),
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
                    trailing: const Text("Ibn Sina"),
                  ),

                ],
              ),
            )

          ],
        ),

      ),
    );
  }
}



