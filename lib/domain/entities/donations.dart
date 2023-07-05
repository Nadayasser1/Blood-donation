

  import 'package:equatable/equatable.dart';

class Donations extends Equatable{

  final String donorName ;
  final String birthData ;
  final String phone ;
  final String branchName ;
  final String donationDate ;

 const Donations({
   required this.donorName,
   required this.birthData,
   required this.phone,
   required  this.branchName,
   required  this.donationDate,
 });

  @override
  List<Object?> get props => [
    donorName,
    birthData,
    phone,
    branchName,
    donationDate,
  ];





}