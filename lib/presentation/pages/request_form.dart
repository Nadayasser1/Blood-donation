// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../core/utils/constants.dart';
import '../../core/widgets/custom_buttons.dart';
import '../../core/widgets/custom_text.dart';
import '../widgets/top_bar.dart';
import 'bottom_appbar.dart';



class RequestForm extends StatelessWidget{
   RequestForm({super.key});

  GlobalKey<FormState> formState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child:
        Container(
          margin: const EdgeInsets.symmetric(vertical: 70,horizontal: 25),
          child:
          Form(
            key: formState,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                CustomTopBar(
                  title: "Request Form",
                  icon:  Icons.arrow_circle_right_outlined,
                  onPressed: (){
                    Get.to(()=> const BottomNavbar());
                  },
                  iconColor: Colors.black38,
                ),
                const SizedBox(height: 20,),
                const TitleText(
                  label: "Patient Name",
                  size: 18,
                  fontWeight: FontWeight.bold,

                ),
                const SizedBox(height: 5,),
                CustomTextField(
                  type: TextInputType.name,
                  text: "Full name",
                  prefix: Icons.person,
                  validator: (value) {
                    if(value!.isEmpty){
                      return"Please enter patient name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10,),
                const TitleText(
                  label: "Patient National Id",
                  size: 18,
                  fontWeight: FontWeight.bold,

                ),
                const SizedBox(height: 5,),
                CustomTextField(
                  type: TextInputType.number,
                  text: "**************",
                  prefix: MdiIcons.cardAccountDetails,
                  validator: (value) {
                    final idCheck = RegExp(r'^[0-9]{14}$');
                    if(value!.isEmpty){
                      return "Please enter patient national id";
                    }
                    else if (!idCheck.hasMatch(value)) {
                      return 'Please enter valid Id';
                    }
                    return null;

                  },
                ),
                const SizedBox(height: 10,),
                const TitleText(
                  label: "Reason",
                  size: 18,
                  fontWeight: FontWeight.bold,

                ),
                const SizedBox(height: 5,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     CustomTextField(validator: (value){},
                //         text: "text")
                //   ],
                // )

                const SizedBox(height: 20,),
                const TitleText(
                  label: "Blood Type",
                  fontWeight: FontWeight.bold,
                  size: 18,
                ),
                const SizedBox(height: 5,),
                GroupButton(
                  options: GroupButtonOptions(
                    borderRadius: BorderRadius.circular(10),
                    selectedColor: kSecColor,
                    unselectedBorderColor: kSecColor
                  ),
                    buttons: const ["O","O-","A","A-","B","B-","AB","AB-"]),
                const SizedBox(height: 20,),
                Center(
                  child: ElevatedButton(
                      onPressed: (){},
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kSecColor)),
                      child: const Text("Submit request",style: TextStyle(fontSize: 20),)),
                )

              ],

            ),

          )
        ),

      )
    );
  }


}