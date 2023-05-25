import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/widgets/constants.dart';
import '../widgets/dot_indecator.dart';
import '../widgets/page_view.dart';
import 'login_view.dart';

class OnBoarding extends StatefulWidget{
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController? pageController;

  @override
  void initState() {
    pageController= PageController(
        initialPage: 0
    )..addListener(() {
      setState(() {

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Container(
        margin: const EdgeInsets.all(30),
        child: Stack(
          children:  [
            AppPageView(
              pageController: pageController,
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 150,
              child: CustomIndecator(
                  index: pageController!.hasClients ? pageController!.page:0
              ),
            ),
            Visibility(
                visible: pageController!.hasClients ? (pageController?.page == 2 ? false : true): true,
                child:Positioned(
                    top: 30,
                    right: 0,
                    child:TextButton(onPressed:(){
                      if (pageController!.page! < 2){
                        pageController?.nextPage(
                            duration: const Duration(milliseconds:100),
                            curve: Curves.bounceIn);
                      } else{
                        Get.to(()=> LogInView());
                      }
                    },
                        child: const Text("Skip",
                          style: TextStyle(
                              color: kTextColor,
                              fontSize: 14),
                        )))),

            Positioned(
              right: 50,
              left: 50,
              bottom: 50,
              child:ElevatedButton(onPressed:(){
                if (pageController!.page! < 2){
                  pageController?.nextPage(
                      duration: const Duration(milliseconds:100),
                      curve: Curves.bounceIn);
                } else{
                  Get.to(()=> LogInView());
                }
              },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kSecColor)),
                  child: Text(pageController!.hasClients ? (pageController?.page == 2 ? "Get Started" : "Next"):"Next",
                    style: const TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,),)),
            )
          ],
        ),
      ),
    );
  }
}