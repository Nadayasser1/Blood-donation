import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/Features/splash/presentation/views/widgets/sliding_image.dart';
import '../../../../onBoarding/presentation/views/onboarding_viwe.dart';

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({Key? key}) : super(key: key);
  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();}

class _SplashViewbodyState extends State<SplashViewbody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    goToNextView();

  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlidingImage(slidingAnimation: slidingAnimation),
      ],
    );
  }
  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void goToNextView() {
    Future.delayed(const Duration(seconds: 4),(){
      Get.to(()=>const OnBoarding(),transition: Transition.rightToLeft);
    });
  }
}
