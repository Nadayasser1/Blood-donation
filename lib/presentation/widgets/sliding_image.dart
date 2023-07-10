import 'package:flutter/material.dart';
import 'package:graduation/core/utils/assets.dart';

class SlidingImage extends StatelessWidget {
  const SlidingImage({
    Key? key,
    required this.slidingAnimation,
  }) : super(key: key);

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
              child: Image.asset(AssetsData.logo)
          );
        });
  }
}

class SlidingText extends StatelessWidget{
  const SlidingText({
    Key? key,
    required this.slidingTextAnimation,
  }) : super(key: key);

  final Animation<Offset> slidingTextAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingTextAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingTextAnimation,
            transformHitTests: false,
            child:
            const Text("BLOOD BANK COMMUNITY",style: TextStyle(
                fontWeight: FontWeight.bold)),

          );
        });
  }

}