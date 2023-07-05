// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/presentation/controller/add_donation_cubit.dart';
import '../../core/services/services_locator.dart';
import '../../core/utils/constants.dart';

class CustomDropDownField extends StatelessWidget {
  CustomDropDownField({super.key,
    this.prefix,
    this.suffix,
    this.suffixPress,});

  final IconData? prefix;
  final IconData? suffix;
  final void Function()? suffixPress;

  String? selectedhospital;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AddDonationCubit>(),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          filled: true,
          fillColor: kPrimaryColor,
          prefixIcon: Icon(
            prefix,
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
          suffixIcon: suffix != null ? IconButton(
            onPressed: suffixPress,
            icon: Icon(
              suffix,
            ),
          )
              : null,
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
          'Red Crescent Hospital'].map<DropdownMenuItem<String>>((
            String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,),
          );
        }).toList(),

      ),
    );
  }


}