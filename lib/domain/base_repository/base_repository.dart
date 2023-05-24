import 'package:dartz/dartz.dart';
import 'package:graduation/core/error/failure.dart';
import 'package:graduation/domain/entities/login.dart';
import 'package:graduation/domain/use_cases/login_use_case.dart';

abstract  class BaseRepository{

  Future<Either<Failure,Login>> postLogin(LoginParameters parameters);

}