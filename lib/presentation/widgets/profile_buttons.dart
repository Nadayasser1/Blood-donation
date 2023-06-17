
import 'package:flutter/material.dart';

import '../../core/utils/constants.dart';

class EndButtons extends StatelessWidget{
  const EndButtons({super.key});


  @override
  Widget build(BuildContext context) {
    return
      Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(onPressed:(){},
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kSecColor)),
                child: const Text("Find Donors",
                  style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold),)),
            ElevatedButton(onPressed:(){},
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kSecColor)),
              child: const Text("Donate Now",
                  style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold)),),
          ],),
        Container(
          padding: const EdgeInsets.only(right: 0,left: 0),
          child: ElevatedButton(onPressed:(){},
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kSecColor)),
              child: const Text("Donation History",
                style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold),)),
        ),

        ElevatedButton(onPressed:(){},
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kSecColor)),
            child: const Text("Requests",
              style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold,),))


      ],
    );
  }

}