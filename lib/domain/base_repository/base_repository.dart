import 'package:dartz/dartz.dart';
import 'package:graduation/core/error/failure.dart';
import 'package:graduation/domain/entities/add_request.dart';
import 'package:graduation/domain/entities/get_request.dart';
import 'package:graduation/domain/entities/login.dart';
import 'package:graduation/domain/entities/register.dart';
import 'package:graduation/domain/entities/user_profile.dart';
import 'package:graduation/domain/use_cases/add_request_use_case.dart';
import 'package:graduation/domain/use_cases/get_request_use_case.dart';
import 'package:graduation/domain/use_cases/login_use_case.dart';

import '../use_cases/register_use_case.dart';
import '../use_cases/user_profile_use_case.dart';

abstract  class BaseRepository{

  Future<Either<Failure,Login>> postLogin(LoginParameters parameters);

  Future<Either<Failure,Register>> postRegister (RegisterParameters parameters);

  Future<Either<Failure,UserProfile>> getProfileData (UserProfileParameters parameters);

  Future<Either<Failure,AddRequest>> addRequest (AddRequestParameters parameters);

  Future<Either<Failure,GetRequest>> getRequests (GetRequestParameters parameters);



}