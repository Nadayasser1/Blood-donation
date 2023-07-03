
 import 'package:equatable/equatable.dart';

class AddDonation extends Equatable{

  final String message ;

const  AddDonation({required this.message});

  @override
  List<Object?> get props => [message];


}