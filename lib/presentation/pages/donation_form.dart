
import 'package:flutter/material.dart';

import '../../core/utils/constants.dart';

class DonationForm extends StatefulWidget {
  const DonationForm({super.key});


  @override
  State<StatefulWidget> createState() {
    return DonationState();
  }

}

class DonationState extends State<DonationForm>{

  bool yes = false;
  bool no = false;
  bool fr = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50,horizontal:5),
        child: ListView(
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
                      child: const Text("Donation Form",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                    ),
                    IconButton(onPressed: (){},
                        icon: const Icon(
                          Icons.arrow_circle_right_outlined,
                          size: 45,
                          color: Colors.black38,))
                  ],
                ),
                const Divider(thickness: 2),
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                      color: cardsColor,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("1. Are you taking any antibiotics?"),
                      SizedBox.square(
                        child: Row(
                          children: [
                            const Text("Yes"),
                            Checkbox(value: yes, onChanged: (val){}),
                            const Text("No"),
                            Checkbox(value: no, onChanged: (val){}),

                          ],
                        ),
                      )

                    ],
                  ),
                ),
              ],
            ),


      )
    );
  }
}