
  import 'package:equatable/equatable.dart';
import 'package:graduation/domain/entities/get_request_data.dart';

class GetRequest extends Equatable {

  final String message ;
  final List<GetRequestsData> requestData;

 const GetRequest({required this.message, required this.requestData});

  @override
  List<Object?> get props =>[
    message,
    requestData,
  ];
  }