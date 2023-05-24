import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String id ;
  final String name;
  final String email;
  final String phone;
  final String gender;

 const UserData({
  required this.id,
   required this.name,
   required this.email,
   required this.phone,
   required this.gender
 });

  @override

  List<Object?> get props => [
    id,
    name,
    email,
    phone,
    gender,
  ];


}