

  import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation/core/base_use_case/base_use_case.dart';
import 'package:graduation/core/error/failure.dart';
import 'package:graduation/domain/base_repository/base_repository.dart';
import 'package:graduation/domain/entities/user_profile.dart';

class UserProfileUseCase extends BaseUseCase<UserProfile,UserProfileParameters>{

  final BaseRepository baseRepository;

  UserProfileUseCase({required this.baseRepository});

  @override
  Future<Either<Failure, UserProfile>> call(UserProfileParameters parameters) {

    return baseRepository.getProfileData(parameters);
  }
}




  class UserProfileParameters extends Equatable{

  final String id ;

 const UserProfileParameters({required this.id});

  @override
  List<Object?> get props => [id,];


  }