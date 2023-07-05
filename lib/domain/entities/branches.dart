
 import 'package:equatable/equatable.dart';

class Branches extends Equatable{

  final String branchName ;
  final String branchPhone ;
  final String branchCity ;
  final String branchAddress ;

const  Branches({
    required  this.branchName,
    required this.branchPhone,
    required this.branchCity,
    required this.branchAddress});

  @override
  List<Object?> get props => [
    branchName,
    branchAddress,
    branchCity,
    branchPhone,
  ];


}