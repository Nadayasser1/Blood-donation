

  import 'package:graduation/domain/entities/register_user_data.dart';

class RegisterUserDataModel extends RegisterUserData{

 const RegisterUserDataModel({required super.id, required super.name, required super.email, required super.phone});


 factory RegisterUserDataModel.fromJson(Map<String,dynamic>json)=>RegisterUserDataModel(
   id: json["id"],
   name:json["name"] ,
   email:json["email"] ,
   phone:json["phone"] ,
 );


}