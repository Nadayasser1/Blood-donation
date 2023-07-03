

  import 'package:graduation/domain/entities/add_donation.dart';

class AddDonationModel extends AddDonation {
 const AddDonationModel({required super.message});


 factory AddDonationModel.fromJson(Map<String,dynamic>json)=>AddDonationModel(message: json["message"]);

}