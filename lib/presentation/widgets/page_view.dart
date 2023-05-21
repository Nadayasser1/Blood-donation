
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/presentation/widgets/page_items.dart';

class AppPageView extends StatelessWidget{
  const AppPageView({super.key,@required this.pageController});
  final PageController? pageController;


  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
        PageItems(
        image: "assets/images/p1-removebg-preview.png",
        title: "Donate to the nearest hospital or"
            " blood bank in need of your blood type."),
        PageItems(
        image: "assets/images/p2-removebg-preview.png",
        title: "We match and contact you with "
            "the nearby blood bank or hospitals.",),
        PageItems(
            image: "assets/images/p3-removebg-preview.png",
            title:"Forever free . . . you can also "
                "get free medical services "
                "if you donate regularly." ),

      ],

    );
  }


}