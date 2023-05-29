import 'package:flutter/material.dart';

class NavigationIcon extends StatelessWidget{
  const NavigationIcon({super.key, required Color color});


  @override
  Widget build(BuildContext context) {
    return  IconButton(onPressed: (){},
        icon: const Icon(
          Icons.arrow_circle_right_outlined,
          size: 45,
          color: Colors.black38,))
    ;
  }


}