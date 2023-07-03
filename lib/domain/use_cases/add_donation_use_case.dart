import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation/core/base_use_case/base_use_case.dart';
import 'package:graduation/core/error/failure.dart';
import 'package:graduation/domain/base_repository/base_repository.dart';
import 'package:graduation/domain/entities/add_donation.dart';

class AddDonationUseCase extends BaseUseCase<AddDonation,AddDonationParameters>{
  final BaseRepository baseRepository ;

  AddDonationUseCase({required this.baseRepository});
  @override
  Future<Either<Failure, AddDonation>> call(AddDonationParameters parameters)async {
   return await baseRepository.addDonation(parameters);
  }
}





class AddDonationParameters extends Equatable{
  final String name;
  final String id;
  final String phone;
  final String birthData;
  final String donationDate;
  final String branchName;
  final String bloodType;

 const AddDonationParameters(this.name, this.id, this.phone, this.birthData, this.donationDate, this.branchName, this.bloodType);

  @override
  List<Object?> get props => [
    name,
    id,
    phone,
    birthData,
    donationDate,
    branchName,
    bloodType,
  ];

}