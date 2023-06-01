import 'package:graduation/domain/entities/login_user_data.dart';

class LoginUserDataModel extends LoginUserData{
 const LoginUserDataModel({required super.id, required super.name, required super.email, required super.phone, required super.gender});

factory LoginUserDataModel.fromJson(Map<String,dynamic>json )=>LoginUserDataModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    gender: json["gender"],
);

}