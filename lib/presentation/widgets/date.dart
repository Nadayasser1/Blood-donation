// // ignore_for_file: library_private_types_in_public_api
//
// import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
//
// class DateOfBirth extends StatefulWidget{
//   const DateOfBirth({super.key});
//
//   @override
//   _DateOfBirthFormState createState() => _DateOfBirthFormState();
//
// }
//
//
// class _DateOfBirthFormState extends State<DateOfBirth> {
//     DateTime _selectedDate = DateTime.now();
//
//   void _showDatePicker() {
//     DatePicker.showDatePicker(
//       context,
//       theme: const DatePickerTheme(
//         cancelStyle: TextStyle(color: Colors.red),
//         doneStyle: TextStyle(color: Colors.green),
//       ),
//       onConfirm: (date) {
//         setState(() {
//           _selectedDate = date;
//         });
//       },
//       currentTime: _selectedDate,
//       locale: LocaleType.en, // Choose your desired locale
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextFormField(
//           readOnly: true,
//            onTap: _showDatePicker,
//           decoration: const InputDecoration(
//           labelText: 'Date of Birth',
//           suffixIcon: Icon(Icons.calendar_today),),),
//
//
//         const SizedBox(height: 16.0),
//         ElevatedButton(
//           onPressed: () {
//             if (_selectedDate != null) {
//               // Process the selected date of birth
//               print('Date of Birth: $_selectedDate');
//             }
//           },
//           child: const Text('Submit'),
//         ),
//       ],
//
//     );
//   }
// }
