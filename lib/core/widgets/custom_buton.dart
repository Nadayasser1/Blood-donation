

import 'package:flutter/cupertino.dart';
import 'constants.dart';

class MainButton extends StatelessWidget{
  const MainButton({super.key, this.text, this.onTap,});
final String? text;
final VoidCallback? onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
//هتتغير مع الMediaquerey
        width: 90,
        decoration: BoxDecoration(
          color: CupertinoColors.systemGroupedBackground,
          borderRadius: BorderRadius.circular(15),
        ),
        child:  Center(
          child: Text(
            text!,
            style:const TextStyle(
              fontSize: 15,
              color: kTextColor,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      )
      ,
    );
  }

}



