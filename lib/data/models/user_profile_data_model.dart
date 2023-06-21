


  import 'package:graduation/domain/entities/user_profile_data.dart';

class UserProfileDataModel extends UserProfileData{

 const UserProfileDataModel({
   required super.id,
   required super.name,
   required super.email,
   required super.phone,
   required super.gender,
   required super.birthdate});

 factory UserProfileDataModel.fromJson(Map<String,dynamic> json)=>UserProfileDataModel(
     id: json["id"],
     name: json["name"],
     email: json["email"],
     phone:json["phone"] ,
     gender:json["gender"] ,
     birthdate:json["birthdate"]
 );

}