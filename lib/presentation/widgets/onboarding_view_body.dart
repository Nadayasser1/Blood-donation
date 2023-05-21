import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/presentation/widgets/page_view.dart';
import '../../../../../core/widgets/constants.dart';
import '../pages/login_view.dart';
import 'dot_indecator.dart';

class OnBoardingBody extends StatefulWidget{
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  PageController? pageController;

  @override
  void initState() {
    pageController=PageController(
      initialPage: 0
    )..addListener(() {
      setState(() {

      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Get.to(()=> const LogInView());
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
                  Get.to(()=> const LogInView());
                }
              },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kSecColor)),
                  child: Text(pageController!.hasClients ? (pageController?.page == 2 ? "Get Started" : "Next"):"Next",
                    style: const TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,),)),
          )
        ],
      ),
    );
  }
}