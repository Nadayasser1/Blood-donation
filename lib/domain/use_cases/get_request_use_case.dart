
 import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation/core/base_use_case/base_use_case.dart';
import 'package:graduation/core/error/failure.dart';
import 'package:graduation/domain/base_repository/base_repository.dart';
import 'package:graduation/domain/entities/get_request.dart';

class GetRequestUseCase extends BaseUseCase<GetRequest,GetRequestParameters>{
  final BaseRepository baseRepository;

  GetRequestUseCase({required this.baseRepository});

  @override
  Future<Either<Failure, GetRequest>> call(GetRequestParameters parameters) async{

    return baseRepository.getRequests(parameters);
  }


}






 class GetRequestParameters extends Equatable{
  final String id;

 const GetRequestParameters({required this.id});

  @override
  List<Object?> get props => [id,];
 }