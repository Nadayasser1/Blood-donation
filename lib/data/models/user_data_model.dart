import 'package:graduation/domain/entities/user_data.dart';

class UserDataModel extends UserData{
 const UserDataModel({required super.id, required super.name, required super.email, required super.phone, required super.gender});

factory UserDataModel.fromJson(Map<String,dynamic>json )=>UserDataModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    gender: json["gender"],
);

}