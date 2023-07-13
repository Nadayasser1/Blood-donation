

  import '../../domain/entities/get_request_data.dart';

class GetRequestsDataModel extends GetRequestsData{
 const GetRequestsDataModel({
   required super.branchName,
   required super.patientName,
   required super.phoneNumber,
   required super.unitNumber,
   required super.bloodType,
   required super.accepted,
   required super.transId,
 });


 factory GetRequestsDataModel.fromJson(Map<String,dynamic>json)=>GetRequestsDataModel(
     branchName: json["BranchName"],
     patientName: json["HumanName"],
     phoneNumber: json["PhoneNumber"],
     unitNumber: json["UnitNumber"],
     bloodType: json["BloodType"],
     accepted: json["Accepted"],
     transId: json["TransId"],
 );



  }