import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../../../../core/widgets/custom_text.dart';

class LoginItems extends StatelessWidget{
  const LoginItems({super.key});



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        Column(
          children: [
            IconButton(
              onPressed: () {  },
              icon:const Icon(MdiIcons.facebook,
                color: Colors.blue,size: 40,),),
            const SignOptionsText(
              title: "Facebook",
            )
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {  },
              icon:const Icon(MdiIcons.google,
                color: Colors.red,size: 40,),),
            const SignOptionsText(
              title: "Gmail",
            )
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {  },
              icon:const Icon(MdiIcons.accountCircle,
                color: Colors.red,size: 40,),),
            const SignOptionsText(
              title: "as Guest",
            )
          ],
        ),


      ],
    )

    ;
  }


}


