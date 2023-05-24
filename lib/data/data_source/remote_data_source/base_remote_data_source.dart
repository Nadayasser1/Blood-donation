import 'package:graduation/data/models/login_model.dart';
import 'package:graduation/domain/use_cases/login_use_case.dart';

abstract class BaseRemoteDataSource {
  Future<LoginModel> postLogin(LoginParameters parameters);
}