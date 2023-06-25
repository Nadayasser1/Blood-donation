

import 'package:graduation/domain/entities/get_request.dart';
import 'package:graduation/domain/entities/get_request_data.dart';

class GetRequestsModel extends GetRequest{

 const GetRequestsModel({required super.message, required super.requestData});


 factory GetRequestsModel.fromJson(Map<String,dynamic>json)=>GetRequestsModel(
     message: json["message"],
     requestData: List<GetRequestsData>.from(json["result"].map((e)=>e)),
 );
}