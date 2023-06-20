import 'package:flutter/material.dart';

import 'package:graduation/presentation/widgets/sliding_image.dart';
import '../../core/services/services_locator.dart';
import '../../core/services/shared_preferences.dart';
import '../../core/utils/routes.dart';

class SplashView extends StatefulWidget {
   const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
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
    return  Scaffold(
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SlidingImage(slidingAnimation: slidingAnimation),
        ],
      ),
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
    Future.delayed(const Duration(seconds: 4),()async{
      final AppPreferences appPreferences=sl<AppPreferences>();
      if(await appPreferences.isOnBoardingScreenViewed()){
        if(await appPreferences.isUserLoggedIn()){
          Navigator.of(context).pushReplacementNamed(Routes.bottomNavbar);
        }else{
          Navigator.of(context).pushReplacementNamed(Routes.login);
        }
      }else{
        Navigator.of(context).pushReplacementNamed(Routes.onBoarding);
      }

     // Get.to(()=> const OnBoarding(),transition: Transition.rightToLeft);
    });
  }

}


