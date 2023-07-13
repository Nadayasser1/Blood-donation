import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/core/utils/constants.dart';
import 'package:graduation/presentation/pages/login_view.dart';
import 'package:graduation/presentation/widgets/sliding_image.dart';
import '../../core/services/services_locator.dart';
import '../../core/services/shared_preferences.dart';
import '../widgets/background.dart';
import 'bottom_appbar.dart';
import 'onBoarding_view.dart';

class SplashView extends StatefulWidget {
   const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController textAnimationController;
  late Animation<Offset> slidingAnimation;
  late Animation<Offset> slidingTextAnimation;



  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    initSlidingTextAnimation();
    goToNextView();

  }
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
    textAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Background(
      child: Scaffold(
        body: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: MediaQuery.of(context).size.height *0.3,
                  child: SlidingImage(slidingAnimation: slidingAnimation)),
                Positioned(
                 left: MediaQuery.of(context).size.width *0.26,
                 bottom: MediaQuery.of(context).size.height *0.4,
                 child: const Text("LifeLine",style: TextStyle(
                  fontSize: 45,
                    fontWeight: FontWeight.bold,color: Color(
                    0xFFB70000)),),
               ),
              Positioned(
                  left: MediaQuery.of(context).size.width *0.25,
                  bottom: MediaQuery.of(context).size.height *0.38
                  ,
                  child: SlidingText(slidingTextAnimation: slidingTextAnimation))
            ],
          ),
      ),
    );
  }
  void initSlidingAnimation() {
    animationController = AnimationController(
      animationBehavior: AnimationBehavior.preserve,
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }
  void initSlidingTextAnimation() {
    textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slidingTextAnimation =
        Tween<Offset>(begin:  Offset(10,0), end: Offset(0,0))
            .animate(textAnimationController);
    textAnimationController.forward();
  }


  void goToNextView() {
    Future.delayed(const Duration(seconds: 6),()async{
      final AppPreferences appPreferences=sl<AppPreferences>();
      if(await appPreferences.isOnBoardingScreenViewed()){
        if(await appPreferences.isUserLoggedIn()){
          Get.off(()=> const BottomNavbar(),transition: Transition.rightToLeft);
          // Navigator.of(context).pushReplacementNamed(Routes.bottomNavbar);
        }else{
          Get.off(()=>  LogInView(),transition: Transition.rightToLeft);
          // Navigator.of(context).pushReplacementNamed(Routes.login);
        }
      }else {
        Get.off(()=> const OnBoarding(),transition: Transition.rightToLeft);
      }
    // Navigator.of(context).pushReplacementNamed(Routes.onBoarding);
      }

     // Get.to(()=> const OnBoarding(),transition: Transition.rightToLeft);
    );
  }

}


