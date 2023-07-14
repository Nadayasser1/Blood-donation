

  import 'package:equatable/equatable.dart';

class GetRequestsData extends Equatable{

  final String branchName;
  final String patientName;
  final String phoneNumber;
  final int unitNumber;
  final String bloodType;
  final String accepted ;
  final int transId;

 const GetRequestsData( {
    required  this.branchName,
    required  this.patientName,
    required  this.phoneNumber,
    required  this.unitNumber,
    required  this.bloodType,
    required this.accepted,
    required this.transId,
  });

  @override
  List<Object?> get props => [
    branchName,
    patientName,
    phoneNumber,
    unitNumber,
    bloodType,
    accepted,
    transId,
  ];

  }