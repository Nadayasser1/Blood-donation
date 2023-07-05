 
 
 import 'package:graduation/data/models/branches_model.dart';
import 'package:graduation/domain/entities/get-branches.dart';

class GetBranchesModel extends GetBranches{
 const GetBranchesModel({
   required super.message,
   required super.branches,
 });
 
 factory GetBranchesModel.fromJson(Map<String,dynamic>json)=>GetBranchesModel(
     message: json["message"],
     branches: List<BranchesModel>.from(json["result"].map((e)=>BranchesModel.fromJson(e))),
 );
}