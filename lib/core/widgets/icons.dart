import 'package:flutter/material.dart';

class NavigationIcon extends StatelessWidget{
  final Color color;
  final IconData? icon;
  const NavigationIcon({super.key, this.icon, required this.color});


  @override
  Widget build(BuildContext context) {
    return  IconButton(onPressed: (){},
        icon:  Icon(
          icon!,
          size: 35,
          color: color,))
    ;
  }


}