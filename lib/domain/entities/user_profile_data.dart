

  import 'package:equatable/equatable.dart';

class UserProfileData extends Equatable{

  final String id ;
  final String name ;
  final String email ;
  final String phone ;
  final String gender ;
  final String birthdate ;

 const UserProfileData({
   required this.id,
   required this.name,
   required this.email,
   required this.phone,
   required this.gender,
   required this.birthdate
     });


  @override
  List<Object?> get props => [
    id,
    name,
    email,
    phone,
    gender,
    birthdate,
  ];

}