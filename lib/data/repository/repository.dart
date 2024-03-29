

  import 'package:dartz/dartz.dart';
import 'package:graduation/core/base_use_case/base_use_case.dart';
import 'package:graduation/core/error/error_handler.dart';
import 'package:graduation/core/error/failure.dart';
import 'package:graduation/data/data_source/remote_data_source/base_remote_data_source.dart';
import 'package:graduation/domain/base_repository/base_repository.dart';
import 'package:graduation/domain/entities/add_donation.dart';
import 'package:graduation/domain/entities/add_request.dart';
import 'package:graduation/domain/entities/get-branches.dart';
import 'package:graduation/domain/entities/get_donations.dart';
import 'package:graduation/domain/entities/get_notifications.dart';
import 'package:graduation/domain/entities/get_request.dart';
import 'package:graduation/domain/entities/login.dart';
import 'package:graduation/domain/entities/questions_form.dart';
import 'package:graduation/domain/entities/register.dart';
import 'package:graduation/domain/entities/user_profile.dart';
import 'package:graduation/domain/use_cases/add_donation_use_case.dart';
import 'package:graduation/domain/use_cases/add_request_use_case.dart';
import 'package:graduation/domain/use_cases/get_donation_use_case.dart';
import 'package:graduation/domain/use_cases/get_notifications_use_case.dart';
import 'package:graduation/domain/use_cases/get_request_use_case.dart';
import 'package:graduation/domain/use_cases/login_use_case.dart';
import 'package:graduation/domain/use_cases/register_use_case.dart';
import 'package:graduation/domain/use_cases/send_questions_use_case.dart';
import 'package:graduation/domain/use_cases/user_profile_use_case.dart';

class Repository extends BaseRepository{
  final BaseRemoteDataSource baseRemoteDataSource ;

  Repository({required this.baseRemoteDataSource});

  @override
  Future<Either<Failure, Login>> postLogin(LoginParameters parameters) async{


    try{
      final result= await baseRemoteDataSource.postLogin(parameters);
      return Right(result);
    }on ErrorHandler catch(error){
        return Left(error.failure);
    }
  }

  @override
  Future<Either<Failure, Register>> postRegister(RegisterParameters parameters) async {
    try{
      final result= await baseRemoteDataSource.postRegister(parameters);
      return Right(result);
    }on ErrorHandler catch(error){
      return Left(error.failure);
    }
  }

  @override
  Future<Either<Failure, UserProfile>> getProfileData(UserProfileParameters parameters) async{

    try{

      final result =await baseRemoteDataSource.getProfileData(parameters);
      return Right(result);

    }on ErrorHandler catch(error){

      return Left(error.failure);

    }
  }

  @override
  Future<Either<Failure, AddRequest>> addRequest(AddRequestParameters parameters)async {
    try{
      final result = await baseRemoteDataSource.addRequest(parameters);
      return Right(result);
    }on ErrorHandler catch(error){
      return Left(error.failure);
    }
  }

  @override
  Future<Either<Failure, GetRequest>> getRequests(GetRequestParameters parameters) async {
  try{
    final result = await baseRemoteDataSource.getRequests(parameters);
    return Right(result);
  }on ErrorHandler catch(error){
    return Left(error.failure);
  }
  }

  @override
  Future<Either<Failure, QuestionsForm>> sendQuestions(SendQuestionsParameters parameters)async {
   try{
     final result =await baseRemoteDataSource.sendQuestions(parameters);
     return Right(result);
   }on ErrorHandler catch(error){
     return Left(error.failure);
   }
  }

  @override
  Future<Either<Failure, AddDonation>> addDonation(AddDonationParameters parameters) async{
   try{
     final result= await baseRemoteDataSource.addDonation(parameters);
     return Right(result);
   }on ErrorHandler catch(error){
    return Left(error.failure);
   }
  }

  @override
  Future<Either<Failure, GetDonations>> getDonations(GetDonationsParameters parameters) async{
   try{
     final result =await baseRemoteDataSource.getDonations(parameters);
     return Right(result);
   }on ErrorHandler catch(error){
     return Left(error.failure);
   }
  }

  @override
  Future<Either<Failure, GetBranches>> getBranches(NoParameters parameters)async {

    try{
      final result =await baseRemoteDataSource.getBranches(parameters);
      return Right(result);
    }on ErrorHandler catch(error){
      return Left(error.failure);
    }

  }

  @override
  Future<Either<Failure, GetNotifications>> getNotifications(GetNotificationsParameters parameters) async{
    try{
      final result =await baseRemoteDataSource.getNotifications(parameters);
      return Right( result);
    }on ErrorHandler catch (error){
      return Left(error.failure);
    }
  }






  }






