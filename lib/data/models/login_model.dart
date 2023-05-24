import 'package:graduation/data/models/user_data_model.dart';
import 'package:graduation/domain/entities/login.dart';

class LoginModel extends Login {

  const LoginModel({required super.message, required super.user});


  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["message"],
        user: UserDataModel.fromJson(json["user"]),
      );
}
