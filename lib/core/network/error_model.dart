import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable{
  final String message ;

 const ErrorModel({required this.message});

 factory ErrorModel.fromJson(Map<String,dynamic>json)=>ErrorModel(message: json["message"]);

  @override
  List<Object?> get props => [message,];

}