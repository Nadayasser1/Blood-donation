

import 'package:flutter/cupertino.dart';

import '../../core/utils/assets.dart';

class Background extends StatelessWidget{
  const Background({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsData.background),
              fit: BoxFit.fill
          )
      ),
      child: child,
    );
  }


}