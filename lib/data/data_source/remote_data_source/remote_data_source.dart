import 'package:dio/dio.dart';
import 'package:graduation/core/base_use_case/base_use_case.dart';
import 'package:graduation/core/error/error_handler.dart';
import 'package:graduation/data/data_source/remote_data_source/base_remote_data_source.dart';
import 'package:graduation/data/data_source/remote_data_source/dio_helper.dart';
import 'package:graduation/data/models/add_donation_model.dart';
import 'package:graduation/data/models/add_request_model.dart';
import 'package:graduation/data/models/get_branches_model.dart';
import 'package:graduation/data/models/get_donations_model.dart';
import 'package:graduation/data/models/get_requests_model.dart';
import 'package:graduation/data/models/login_model.dart';
import 'package:graduation/data/models/register_model.dart';
import 'package:graduation/data/models/send_questions_model.dart';
import 'package:graduation/data/models/user_profile_model.dart';
import 'package:graduation/domain/use_cases/add_donation_use_case.dart';
import 'package:graduation/domain/use_cases/add_request_use_case.dart';
import 'package:graduation/domain/use_cases/get_donation_use_case.dart';
import 'package:graduation/domain/use_cases/get_request_use_case.dart';
import 'package:graduation/domain/use_cases/login_use_case.dart';
import 'package:graduation/domain/use_cases/register_use_case.dart';
import 'package:graduation/core//utils/app-constance.dart';
import 'package:graduation/domain/use_cases/send_questions_use_case.dart';
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

  @override
  Future<AddRequestModel> addRequest(AddRequestParameters parameters) async{
    try{
      final response = await DioHelper.postData(path: AppConstance.addRequestPath(name: parameters.name, id: parameters.id, phone: parameters.phone, birthDate: parameters.birthDate, unitNumber: parameters.unitNumber, bloodType: parameters.bloodType, reason: parameters.reason));
      if(response.statusCode==201){
        return AddRequestModel.fromJson(response.data);
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

  @override
  Future<GetRequestsModel> getRequests(GetRequestParameters parameters)async {
  try{
    final response =await DioHelper.postData(path: AppConstance.getRequestsPath(id: parameters.id));
    if(response.statusCode==200){
      return GetRequestsModel.fromJson(response.data);
    }else {
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

  @override
  Future<SendQuestionsModel> sendQuestions(SendQuestionsParameters parameters) async {
    try{
    final response =await DioHelper.postData(path: AppConstance.sendQuestionsPath(q1: parameters.q1, q2: parameters.q2, q3: parameters.q3, q4: parameters.q4, q5: parameters.q5, q6: parameters.q6, q7: parameters.q7, q8: parameters.q8));
    if(response.statusCode==200){
      return SendQuestionsModel.fromJson(response.data);
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

  @override
  Future<AddDonationModel> addDonation(AddDonationParameters parameters) async{
   try{
     final response =await DioHelper.postData(path: AppConstance.addDonationPath(name: parameters.name, id: parameters.id, phone: parameters.phone, birthData: parameters.birthData, donationDate: parameters.donationDate, branchName: parameters.branchName, bloodType: parameters.bloodType));
     if(response.statusCode==201){
       return AddDonationModel.fromJson(response.data);
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

  @override
  Future<GetDonationsModel> getDonations(GetDonationsParameters parameters) async{
    try{
      final response =await DioHelper.postData(path: AppConstance.getDonationsPath(id: parameters.id));
      if(response.statusCode==200){
        return GetDonationsModel.fromJson(response.data);
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

  @override
  Future<GetBranchesModel> getBranches(NoParameters parameters) async{
    try{
      final response =await DioHelper.postData(path: AppConstance.getBranchesPath());
      if(response.statusCode==200){
        return GetBranchesModel.fromJson(response.data);
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

