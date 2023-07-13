


  import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation/core/base_use_case/base_use_case.dart';
import 'package:graduation/core/error/failure.dart';
import 'package:graduation/domain/base_repository/base_repository.dart';
import 'package:graduation/domain/entities/get_notifications.dart';

class GetNotificationsUseCase extends BaseUseCase<GetNotifications,GetNotificationsParameters>{
  final BaseRepository baseRepository ;

  GetNotificationsUseCase({required this.baseRepository});
  @override
  Future<Either<Failure, GetNotifications>> call(GetNotificationsParameters parameters) async{
   return await baseRepository.getNotifications(parameters);
  }
}




  class GetNotificationsParameters extends Equatable {

  final String id ;

 const GetNotificationsParameters({required this.id});

  @override
  List<Object?> get props => [id,];

  }