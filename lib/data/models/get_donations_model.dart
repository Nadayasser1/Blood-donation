

  import 'package:graduation/data/models/donations_model.dart';
import 'package:graduation/domain/entities/get_donations.dart';

class GetDonationsModel extends GetDonations{
 const GetDonationsModel({
   required super.count,
   required super.bloodType,
   required super.lastDonation,
   required super.message,
   required super.donations,
 });

 factory GetDonationsModel.fromJson(Map<String,dynamic>json)=>GetDonationsModel(
     count: json["count"],
     bloodType: json["bloodType"],
     lastDonation: json["lastDonation"],
     message: json["message"],
     donations: List<DonationsModel>.from(json["result"].map((e)=>DonationsModel.fromJson(e))),
 );
}