import 'package:flutter/material.dart';

import '../../../../../../core/widgets/constants.dart';


class YourDonations extends StatelessWidget{
  const YourDonations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Your Donation",
                  style: TextStyle(
                    fontSize: 30,fontWeight:
                    FontWeight.bold)),
                IconButton(onPressed: (){}, icon: const Icon(
                   Icons.arrow_back,
                   size: 30,))
              ],
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



