
 import 'package:graduation/domain/entities/branches.dart';

class BranchesModel extends Branches {
 const BranchesModel({
   required super.branchName,
   required super.branchPhone,
   required super.branchCity,
   required super.branchAddress,
 });

 factory BranchesModel.fromJson(Map<String,dynamic>json)=>BranchesModel(
     branchName: json["BranchName"],
     branchPhone: json["BB_Phone"],
     branchCity: json["BB_City"],
     branchAddress: json["BB_Address"],
 );
}