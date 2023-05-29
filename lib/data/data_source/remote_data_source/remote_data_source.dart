import 'package:dio/dio.dart';
import 'package:graduation/core/error/exception.dart';
import 'package:graduation/core/network/error_model.dart';
import 'package:graduation/data/data_source/remote_data_source/base_remote_data_source.dart';
import 'package:graduation/data/models/login_model.dart';
import 'package:graduation/domain/use_cases/login_use_case.dart';

class RemoteDataSource extends BaseRemoteDataSource{

  @override
  Future<LoginModel>  postLogin(LoginParameters parameters) async {

      final response = await Dio().post("http://13.51.254.230:3000/login?email=${parameters.email}&password=${parameters.password}");

      if (response.statusCode==200){
        return LoginModel.fromJson(response.data);
      }else{

        throw ServerException(errorModel: ErrorModel.fromJson(response.data));
      }


  }
}

/// email : ali2.com
/// password : 123456