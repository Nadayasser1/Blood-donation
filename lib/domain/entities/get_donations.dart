

  import 'package:equatable/equatable.dart';
import 'package:graduation/domain/entities/donations.dart';

class GetDonations extends Equatable{

  final String message ;
  final List<Donations> donations;

 const GetDonations({
    required this.message,
    required this.donations,
  });

  @override
  List<Object?> get props => [
    message,
    donations,
  ];
  }