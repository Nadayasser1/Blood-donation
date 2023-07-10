import 'package:flutter/material.dart';
import 'package:graduation/core/utils/assets.dart';
import '../widgets/home_cards.dart';

class HomeViewbody extends StatelessWidget {
  const HomeViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
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
        title: const Text("LifeLine"),
        automaticallyImplyLeading:false,
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: const [
                AnimatedHomeContainer()
              ],
      ),
          ),),
    );


  }
}
