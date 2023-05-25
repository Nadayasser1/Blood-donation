

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation/core/base_use_case/base_use_case.dart';
import 'package:graduation/core/error/failure.dart';
import 'package:graduation/domain/base_repository/base_repository.dart';
import 'package:graduation/domain/entities/login.dart';

class LoginUseCase extends BaseUseCase<Login,LoginParameters>{
  final BaseRepository baseRepository;


  LoginUseCase( {required this.baseRepository});
  @override
  Future<Either<Failure, Login>> call(LoginParameters parameters) async{

    return await baseRepository.postLogin(parameters);
  }

}





class LoginParameters extends Equatable{

  final String email;
  final String password;

 const LoginParameters({required this.email,required this.password});

  @override
  List<Object?> get props => [email,password,];

}