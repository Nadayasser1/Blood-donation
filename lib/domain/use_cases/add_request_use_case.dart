


  import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation/core/base_use_case/base_use_case.dart';
import 'package:graduation/core/error/failure.dart';
import 'package:graduation/domain/base_repository/base_repository.dart';
import 'package:graduation/domain/entities/add_request.dart';

class AddRequestUseCase extends BaseUseCase<AddRequest,AddRequestParameters>{

  final BaseRepository baseRepository;

  AddRequestUseCase({required this.baseRepository});
  @override
  Future<Either<Failure, AddRequest>> call(AddRequestParameters parameters) async{

    return await baseRepository.addRequest(parameters);
  }


}










  class AddRequestParameters extends Equatable{

  final String name;
  final String id;
  final String phone;
  final String birthDate;
  final String unitNumber;
  final String bloodType;
  final String reason;

 const AddRequestParameters({
    required this.name,
    required this.id,
    required this.phone,
    required this.birthDate,
    required this.unitNumber,
    required this.bloodType,
    required  this.reason,
 });

  @override
  List<Object?> get props => [
    name,
    id,
    phone,
    birthDate,
    unitNumber,
    bloodType,
    reason,
  ];
  }