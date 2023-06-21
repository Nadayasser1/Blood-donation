

  import 'package:equatable/equatable.dart';
import 'package:graduation/domain/entities/user_profile_data.dart';

class UserProfile extends Equatable{

 final String message;
 final UserProfileData userProfileData;

 const UserProfile({
  required this.message,
   required this.userProfileData,
 });



  @override
  List<Object?> get props =>[
    message,
    userProfileData,
  ];


}