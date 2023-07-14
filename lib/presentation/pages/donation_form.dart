// ignore_for_file: must_be_immutable
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:graduation/core/widgets/date_picker.dart';
import 'package:graduation/domain/use_cases/add_donation_use_case.dart';
import 'package:graduation/presentation/controller/add_donation_cubit.dart';
import 'package:group_button/group_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../core/functions/toast_message.dart';
import '../../core/services/services_locator.dart';
import '../../core/services/shared_preferences.dart';
import '../../core/utils/constants.dart';
import '../../core/widgets/custom_buttons.dart';
import '../../core/widgets/custom_progress_indecator.dart';
import '../../core/widgets/custom_text.dart';
import '../widgets/appBar.dart';
import '../widgets/background.dart';
import 'bottom_appbar.dart';

class DonationForm extends StatelessWidget {
   DonationForm({super.key});

  var donorNameController = TextEditingController();
  var phoneController = TextEditingController();
  var birthDateController = TextEditingController();
  var donationDateController = TextEditingController();
  var branchNameController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();
   String? selectedhospital ;
   String _bloodType= "";




   @override
  Widget build(BuildContext context) {
     final AppPreferences appPreferences=sl<AppPreferences>();
     final String id= appPreferences.getToken();
    return BlocConsumer<AddDonationCubit, AddDonationState>(
     listener: (context, state) {
       if(state is AddDonationSuccessState){
         Toastmessage(context, "Accepted request");
         Get.offAll(()=> const BottomNavbar());
       }
       else if(state is AddDonationErrorState){
         Toastmessage(context, state.error);
       }
    },
     builder: (context, state) {
      return Background(
        child: Scaffold(
        appBar: pageAppBar("Donation Form"),
         body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: formState,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const TitleText(
                    label: "Donor Name",
                    size: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  CustomTextField(
                    controller:donorNameController ,
                    type: TextInputType.name,
                    text: "Full name",
                    prefix: Icons.person,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter donor name";
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
                        label: "Date of Birth",
                        size: 18,
                        fontWeight: FontWeight.bold,
                      ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child:
                       CustomDatePicker(
                            controller: birthDateController,
                          )
                      ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const TitleText(
                    label: "Branch Name",
                    fontWeight: FontWeight.bold,
                    size: 18,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                DropdownButtonFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(0),
                  filled: true,
                  fillColor: kPrimaryColor,
                  prefixIcon: const Icon(
                    MdiIcons.hospitalBuilding
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black54,
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: kSecColor)),
                ),
                dropdownColor: kPrimaryColor,
                value: selectedhospital,
                onChanged: (String? value) {
                  selectedhospital = value;
                },
                items: <String>[
                  'Central Blood Bank',
                  'Tanta Blood Bank',
                  'Mansora Blood Bank',
                  'Ibn Sina Hospital',
                  'Dar El Shefaa Hospital',
                  'Red Crescent Hospital'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,),
                  );
                }).toList(),

              ),

              SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const TitleText(
                    label: "Donation Date",
                    size: 18,
                    fontWeight: FontWeight.bold,
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child:
                      CustomDatePicker(
                        controller: donationDateController,
                      )
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
                        buttons: const [
                          "O+",
                          "O-",
                          "A+",
                          "A-",
                          "B+",
                          "B-",
                          "AB+",
                          "AB-"
                        ]),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),

                  Center(
                    child: ConditionalBuilder(
                      condition: state is! AddDonationLoadingState,
                      builder: (context) => ElevatedButton(
                              onPressed: () {
                                if(formState.currentState!.validate()){
                                  BlocProvider.of<AddDonationCubit>(context).addDonation(AddDonationParameters(
                                      donorNameController.text,
                                      id,
                                      phoneController.text,
                                      birthDateController.text,
                                      donationDateController.text,
                                      selectedhospital!,
                                      _bloodType));

                                }
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(kSecColor)),
                              child: const Text(
                                "Submit request",
                                style: TextStyle(fontSize: 20),
                              )),
                      fallback: (context)=>const CustomProgressIndecator(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    ),
      );
  },
);

  }
}
