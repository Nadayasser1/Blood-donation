import 'package:equatable/equatable.dart';
import 'package:graduation/domain/entities/user_data.dart';

class Login extends Equatable {
  final String message;

  final UserData user;

  const Login({required this.message, required this.user});

  @override
  List<Object?> get props => [
        message,
        user,
      ];
}
