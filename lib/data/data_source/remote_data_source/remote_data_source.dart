import 'package:dio/dio.dart';
import 'package:graduation/core/error/error_handler.dart';
import 'package:graduation/data/data_source/remote_data_source/base_remote_data_source.dart';
import 'package:graduation/data/data_source/remote_data_source/dio_helper.dart';
import 'package:graduation/data/models/login_model.dart';
import 'package:graduation/data/models/register_model.dart';
import 'package:graduation/data/models/user_profile_model.dart';
import 'package:graduation/domain/use_cases/login_use_case.dart';
import 'package:graduation/domain/use_cases/register_use_case.dart';
import 'package:graduation/core//utils/app-constance.dart';
import 'package:graduation/domain/use_cases/user_profile_use_case.dart';


class RemoteDataSource extends BaseRemoteDataSource{

  @override
  Future<LoginModel>  postLogin(LoginParameters parameters) async {

      try{
        final response = await DioHelper.postData(path: AppConstance.loginPath(email:parameters.email, password: parameters.password));

        if (response.statusCode==200){
          return LoginModel.fromJson(response.data);
        }else{

          throw Exception();
        }

      }catch (error){
        if(error is DioError){
          throw ErrorHandler.handle(error);

        }else{

          throw Exception();
        }
      }

  }

  @override
  Future<RegisterModel> postRegister(RegisterParameters parameters) async{
    try{

      final response = await DioHelper.postData(path:AppConstance.registerPath(id: parameters.id, name: parameters.name, email:parameters.email, password: parameters.password, phone: parameters.phone, gender: parameters.gender, birthdate: parameters.birthdate), );

      if (response.statusCode==200){
        return RegisterModel.fromJson(response.data);
      }else{

        throw Exception();
      }

    }catch (error){
      if(error is DioError){
         throw ErrorHandler.handle(error);

      }else{
        throw Exception();
      }
    }
  }

  @override
  Future<UserProfileModel> getProfileData(UserProfileParameters parameters) async{

    try{

      final response =await DioHelper.postData(path: AppConstance.userProfilePath(id: parameters.id));

      if(response.statusCode==200){
        return UserProfileModel.fromJason(response.data);
      }else{
        throw Exception();
      }

    }catch(error){
      if(error is DioError){
        throw ErrorHandler.handle(error);
      }else{
        throw Exception();
      }
    }
  }
}

