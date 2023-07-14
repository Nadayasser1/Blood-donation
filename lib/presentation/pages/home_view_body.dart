import 'package:flutter/material.dart';
import 'package:graduation/core/utils/assets.dart';
import '../widgets/appBar.dart';
import '../widgets/background.dart';
import '../widgets/home_cards.dart';

class HomeViewbody extends StatelessWidget {
  const HomeViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Background(
      child: Scaffold(
        appBar: customAppBar("LifeLine"),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  AnimatedHomeContainer()
                ],
        ),
            ),),
      ),
    );


  }
}
