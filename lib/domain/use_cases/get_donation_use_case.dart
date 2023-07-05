

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation/core/base_use_case/base_use_case.dart';
import 'package:graduation/core/error/failure.dart';
import 'package:graduation/domain/base_repository/base_repository.dart';
import 'package:graduation/domain/entities/get_donations.dart';


class GetDonationsUseCase extends BaseUseCase<GetDonations,GetDonationsParameters>{
  final BaseRepository baseRepository;

  GetDonationsUseCase({required this.baseRepository});
  @override
  Future<Either<Failure, GetDonations>> call(GetDonationsParameters parameters)async {
   return await baseRepository.getDonations(parameters);
  }
}












class GetDonationsParameters extends Equatable{
  final String id;

  const GetDonationsParameters({required this.id});

  @override
  List<Object?> get props => [id,];
}