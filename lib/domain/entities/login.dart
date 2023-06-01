import 'package:equatable/equatable.dart';
import 'package:graduation/domain/entities/login_user_data.dart';

class Login extends Equatable {
  final String message;

  final LoginUserData user;

  const Login({required this.message, required this.user});

  @override
  List<Object?> get props => [
        message,
        user,
      ];
}
