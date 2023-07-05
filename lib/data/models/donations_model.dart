

  import 'package:graduation/domain/entities/donations.dart';

class DonationsModel extends Donations{
const  DonationsModel({
  required super.donorName,
  required super.birthData,
  required super.phone,
  required super.branchName,
  required super.donationDate,
});
 factory DonationsModel.fromJson(Map<String,dynamic>json)=>DonationsModel(
     donorName: json["HumanName"],
     birthData: json["BirthDate"],
     phone: json["PhoneNumber"],
     branchName: json["BranchName"],
     donationDate: json["TransDate"],
 );
}
