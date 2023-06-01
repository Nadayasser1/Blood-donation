

  import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation/core/base_use_case/base_use_case.dart';
import 'package:graduation/core/error/failure.dart';
import 'package:graduation/domain/base_repository/base_repository.dart';
import 'package:graduation/domain/entities/register.dart';

class RegisterUseCase extends BaseUseCase<Register,RegisterParameters>{
  final BaseRepository baseRepository ;

  RegisterUseCase({required this.baseRepository});
  @override
  Future<Either<Failure, Register>> call(RegisterParameters parameters)async {

    return await baseRepository.postRegister(parameters);

  }

}










class RegisterParameters extends Equatable{
  final String id;
  final String name;
  final String email;
  final String password;
  final String phone;
  final String gender;

 const RegisterParameters(this.id, this.name, this.email, this.password, this.phone, this.gender);

  @override

  List<Object?> get props => [
    id,
    name,
    email,
    password,
    phone,
    gender,
  ];


}