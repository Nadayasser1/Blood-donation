

  import 'package:dartz/dartz.dart';
import 'package:graduation/core/error/exception.dart';
import 'package:graduation/core/error/failure.dart';
import 'package:graduation/data/data_source/remote_data_source/base_remote_data_source.dart';
import 'package:graduation/domain/base_repository/base_repository.dart';
import 'package:graduation/domain/entities/login.dart';
import 'package:graduation/domain/use_cases/login_use_case.dart';

class Repository extends BaseRepository{
  final BaseRemoteDataSource baseRemoteDataSource ;

  Repository({required this.baseRemoteDataSource});

  @override
  Future<Either<Failure, Login>> postLogin(LoginParameters parameters) async{

    final result= await baseRemoteDataSource.postLogin(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return left(ServerFailure(failure.errorModel.message));
    }
  }

  }