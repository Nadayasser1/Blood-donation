
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/widgets/icons.dart';
import '../../../../../../core/widgets/custom_text.dart';
import '../../core/widgets/custom_buttons.dart';


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
          const DataEntryfield(
            label: "Patient Name",
            inputType: TextInputType.name,
            text: "Full name",),
          const SizedBox(height: 10,),
          const DataEntryfield(
            label:"Patient National Id" ,
            inputType: TextInputType.number,
            text: "**************",),
          const SizedBox(height: 10,),

          const DataEntryfield(
            label:"Reason" ,
            inputType: TextInputType.multiline,
            text: "Write the reason",),




        ],

      ),
    );
  }


}