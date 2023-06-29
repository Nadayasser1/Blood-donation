

import 'package:graduation/data/models/get_requests_data_model.dart';
import 'package:graduation/domain/entities/get_request.dart';

class GetRequestsModel extends GetRequest{

 const GetRequestsModel({required super.message, required super.requestData});


 factory GetRequestsModel.fromJson(Map<String,dynamic>json)=>GetRequestsModel(
     message: json["message"],
     requestData: List<GetRequestsDataModel>.from(json["result"].map((x)=>GetRequestsDataModel.fromJson(x)),
 ),
 );
}