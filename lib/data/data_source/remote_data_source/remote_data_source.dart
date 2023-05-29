import 'package:dio/dio.dart';
import 'package:graduation/core/error/error_handler.dart';
import 'package:graduation/data/data_source/remote_data_source/base_remote_data_source.dart';
import 'package:graduation/data/models/login_model.dart';
import 'package:graduation/domain/use_cases/login_use_case.dart';

class RemoteDataSource extends BaseRemoteDataSource{

  @override
  Future<LoginModel>  postLogin(LoginParameters parameters) async {

      try{
        final response = await Dio().post("http://13.51.254.230:3000/login?email=${parameters.email}&password=${parameters.password}");

        if (response.statusCode==200){
          return LoginModel.fromJson(response.data);
        }else{

          throw Exception();
        }

      }catch (error){
        if(error is DioError){
          print(error.response!.data);

          print(error.response!.statusMessage);

          throw ErrorHandler.handle(error);
        }else{
          throw Exception();
        }
      }

  }
}

/// email : ali2.com
/// password : 123456