import 'package:graduation/data/models/login_model.dart';
import 'package:graduation/data/models/register_model.dart';
import 'package:graduation/domain/use_cases/login_use_case.dart';
import 'package:graduation/domain/use_cases/register_use_case.dart';

import '../../../domain/use_cases/user_profile_use_case.dart';
import '../../models/user_profile_model.dart';


abstract class BaseRemoteDataSource {

  Future<LoginModel> postLogin(LoginParameters parameters);

  Future<RegisterModel> postRegister(RegisterParameters parameters);

  Future<UserProfileModel> getProfileData(UserProfileParameters parameters);


}