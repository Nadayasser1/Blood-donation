

  import 'package:equatable/equatable.dart';
import 'package:graduation/domain/entities/register_user_data.dart';

class Register extends Equatable{

  final String message ;
  final RegisterUserData userInfo ;

 const Register({required this.message,required this.userInfo});

  @override

  List<Object?> get props =>[
    message,
    userInfo,
  ] ;

  }