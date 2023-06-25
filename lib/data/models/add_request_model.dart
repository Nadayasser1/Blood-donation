

  import 'package:graduation/domain/entities/add_request.dart';

class AddRequestModel extends AddRequest{

 const AddRequestModel({required super.message});

 factory AddRequestModel.fromJson(Map<String,dynamic>json)=>AddRequestModel(
     message: json["message"],
 );
}