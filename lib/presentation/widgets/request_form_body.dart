
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/widgets/data_entry_field.dart';
import '../../../../../../core/widgets/icons.dart';
import '../../../../../../core/widgets/title_form_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RequestFormBody extends StatelessWidget{
  const RequestFormBody({super.key});



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 70,horizontal: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            TopBarText(text: "Request Form"),
            NavigationIcon(),
          ],),
          const SizedBox(height: 10,),
          const Datafield(
            label: "Patient Name",
            inputType: TextInputType.name,
            text: "Full name",),
          const SizedBox(height: 10,),
          const Datafield(
            label:"Patient National Id" ,
            inputType: TextInputType.number,
            text: "**************",),
          const SizedBox(height: 10,),

          const Datafield(
            label:"Reason" ,
            inputType: TextInputType.multiline,
            text: "Write the reason",),




        ],

      ),
    );
  }


}