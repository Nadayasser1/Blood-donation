

  import 'package:graduation/domain/entities/register.dart';

import 'register_user_data_model.dart';

class RegisterModel extends Register{

 const RegisterModel({required super.message, required super.userInfo});


 factory RegisterModel.fromJson(Map<String,dynamic>json)=>RegisterModel(
   message: json["message"],
   userInfo: RegisterUserDataModel.fromJson(json["userInfo"]),
 );


}