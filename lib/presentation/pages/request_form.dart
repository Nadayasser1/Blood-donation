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

class RequestForm extends StatelessWidget {
  RequestForm({super.key});
  var nameController = TextEditingController();
  var unitNumberController = TextEditingController();
  var idController = TextEditingController();
  // String _typ = "";
  // DateTime _date = DateTime.now();

  GlobalKey<FormState> formState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(

           child: Padding(
             padding: const EdgeInsets.symmetric(vertical: 70,horizontal: 20.0),
             child: Form(
               key: formState,
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTopBar(
                      title: "Request Form",
                      icon: Icons.arrow_circle_right_outlined,
                      onPressed: () {
                        Get.to(() => const BottomNavbar());
                      },
                      iconColor: Colors.black38,
                    ),
                     SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    const TitleText(
                      label: "Patient Name",
                      size: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    CustomTextField(
                      controller:nameController ,
                      type: TextInputType.name,
                      text: "Full name",
                      prefix: Icons.person,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter patient name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    const TitleText(
                      label: "Patient National Id",
                      size: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    CustomTextField(
                      controller: idController,
                      type: TextInputType.number,
                      text: "******",
                      prefix: MdiIcons.cardAccountDetails,
                      validator: (value) {
                        final idCheck = RegExp(r'^[0-9]{14}$');
                        if (value!.isEmpty) {
                          return "Please enter patient national id";
                        } else if (!idCheck.hasMatch(value)) {
                          return 'Please enter valid Id';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    const TitleText(
                      label: "Reason",
                      size: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: CustomTextField(
                            validator: (value) {
                              if(value!.isEmpty){
                                return"please enter the reason";
                              }
                              return null;
                            },
                            text: "Write the Reason",
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.text_snippet,
                              size: 35,
                              color: iconColor ,))
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        TitleText(
                          label: "Date of Birth",
                          size: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        TitleText(
                          label: "No. of unit",
                          size: 18,
                          fontWeight: FontWeight.bold,
                        ),

                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: CustomTextField(
                            validator: (value) {},
                            text: "yy/mm/dd",
                            prefix: Icons.calendar_month_outlined,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: CustomTextField(
                            controller: unitNumberController,
                            validator: (value) {
                              if(value!.isEmpty){
                                return "Enter number of unit ";
                              }
                              return null;
                            },
                            text: "",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    const TitleText(
                      label: "Blood Type",
                      fontWeight: FontWeight.bold,
                      size: 18,
                    ),
                     SizedBox(
                      height: MediaQuery.of(context).size.height *0.02,
                    ),
                    GroupButton(
                        options: GroupButtonOptions(
                            borderRadius: BorderRadius.circular(10),
                            selectedColor: kSecColor,
                            unselectedBorderColor: kSecColor),
                        buttons: const [
                          "O",
                          "O-",
                          "A",
                          "A-",
                          "B",
                          "B-",
                          "AB",
                          "AB-"
                        ]),
                     SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Center(
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(kSecColor)),
                          child: const Text(
                            "Submit request",
                            style: TextStyle(fontSize: 20),
                          )),
                    )
                  ],
          ),
               ),
             ),
           ),
        )
    ;
  }
}
