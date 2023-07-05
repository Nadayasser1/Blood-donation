import 'package:flutter/material.dart';
import 'package:graduation/core/widgets/custom_text.dart';

class CustomTopBar extends StatelessWidget{
  const CustomTopBar({super.key,  this.title, this.onPressed, this.icon,  this.iconColor});

  final String? title ;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: TopBarText(text: title, color: Colors.black,),
          trailing: IconButton(
            icon: Icon(
              icon,
              size: 45,
              color: iconColor,
            ),
          onPressed:onPressed,),
        ),
        const Divider(thickness: 1,)
      ],
    );
  }


}