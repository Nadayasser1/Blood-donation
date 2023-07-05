

  import 'package:graduation/data/models/donations_model.dart';
import 'package:graduation/domain/entities/get_donations.dart';

class GetDonationsModel extends GetDonations{
 const GetDonationsModel({
   required super.message,
   required super.donations,
 });

 factory GetDonationsModel.fromJson(Map<String,dynamic>json)=>GetDonationsModel(
     message: json["message"],
     donations: List<DonationsModel>.from(json["result"].map((e)=>DonationsModel.fromJson(e))),
 );
}