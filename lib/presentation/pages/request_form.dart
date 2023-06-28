// ignore_for_file: must_be_immutable
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:graduation/core/widgets/date_picker.dart';
import 'package:graduation/domain/use_cases/add_request_use_case.dart';
import 'package:group_button/group_button.dart';
import '../../core/functions/toast_message.dart';
import '../../core/services/services_locator.dart';
import '../../core/services/shared_preferences.dart';
import '../../core/utils/constants.dart';
import '../../core/widgets/custom_buttons.dart';
import '../../core/widgets/custom_text.dart';
import '../controller/add_request_cubit.dart';
import '../widgets/top_bar.dart';
import 'bottom_appbar.dart';

class RequestForm extends StatelessWidget {
  RequestForm({super.key});
  var patientNameController = TextEditingController();
  var unitNumberController = TextEditingController();
  var dateController = TextEditingController();
  var reasonController = TextEditingController();
  var phoneController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();
  String _bloodType= "";


  @override
  Widget build(BuildContext context) {
    final AppPreferences appPreferences=sl<AppPreferences>();
    final String id= appPreferences.getToken();
    return BlocConsumer<AddRequestCubit, AddRequestState>(
    listener: (context, state) {
      if(state is AddRequestSuccessState){
        Toastmessage(context, "Accepted request");
        Get.offAll(()=> const BottomNavbar());
      }
      else if(state is AddRequestErrorState){
        Toastmessage(context, state.error);
      }

    },
    builder: (context, state) {
      return Scaffold(
        appBar: AppBar(

        ),
        body: SingleChildScrollView(
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10),
             child: Form(
               key: formState,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
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
                      controller:patientNameController ,
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
                      label: "Phone",
                      size: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    CustomTextField(
                      controller: phoneController,
                      text: "Enter your phone number",
                      prefix: Icons.phone,
                      type: TextInputType.number,
                      validator: (value){
                        final phoneCheck = RegExp(r'^[0-9]{11}$');
                        if(value!.isEmpty){
                          return "enter your phone number";
                        }
                        else if (!phoneCheck.hasMatch(value)){
                          return "Please enter a valid phone number";
                        }
                        return null;},
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
                    CustomTextField(
                      controller: reasonController,
                      validator: (value) {
                        if(value!.isEmpty){
                          return"please enter the reason";
                        }
                        return null;
                      },
                      text: "",
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
                          child:
                           CustomDatePicker(
                            controller: dateController,
                          )
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: CustomTextField(
                            type: TextInputType.number,
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
                      height: MediaQuery.of(context).size.height *0.01,
                    ),
                    Center(
                      child: GroupButton(
                          options: GroupButtonOptions(
                              borderRadius: BorderRadius.circular(10),
                              selectedColor: kSecColor,
                              unselectedBorderColor: kSecColor),
                          onSelected: (value, index, isSelected) {
                            if (value=="O+"){
                              _bloodType = "O%2B";}

                            else if (value=="O-"){
                              _bloodType ="O-";}

                            else if (value=="A+"){
                              _bloodType ="A%2B";}

                            else if (value=="A-"){
                              _bloodType="A-";}

                            else if (value=="B+"){
                              _bloodType="B%2B";}

                            else if (value=="B-"){
                              _bloodType ="B-";}

                            else if (value=="AB+"){
                              _bloodType ="AB%2B";}

                            else if (value=="AB-"){
                              _bloodType ="AB-";}
                          },
                          buttons: const ["O+", "O-", "A+", "A-", "B+", "B-", "AB+", "AB-"
                          ]),
                    ),
                     SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Center(
                      child: ConditionalBuilder(
                        condition: state is! AddRequestLoadingState,
                        builder:(context) =>  ElevatedButton(
                            onPressed: () {
                              if(formState.currentState!.validate()){
                                BlocProvider.of<AddRequestCubit>(context).addRequest(
                                    AddRequestParameters(
                                        name: patientNameController.text,
                                        id: id,
                                        phone: phoneController.text,
                                        birthDate: dateController.text,
                                        unitNumber: unitNumberController.text,
                                        bloodType: _bloodType ,
                                        reason: reasonController.text));
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(kSecColor)),
                            child: const Text(
                              "Submit request",
                              style: TextStyle(fontSize: 20),
                            )),
                        fallback: (context)=>const CircularProgressIndicator(),
                      ),
                    )
                  ],
          ),
               ),
             ),
           ),
        );
  },
)
    ;
  }
}
