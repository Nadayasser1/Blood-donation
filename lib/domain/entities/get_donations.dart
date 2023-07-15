

  import 'package:equatable/equatable.dart';
import 'package:graduation/domain/entities/donations.dart';

class GetDonations extends Equatable{

  final String message ;
  final int count ;
  final String? bloodType;
  final String? lastDonation;
  final List<Donations> donations;

 const GetDonations({
    required this.count,
      this.bloodType,
      this.lastDonation,
    required this.message,
    required this.donations,
  });

  @override
  List<Object?> get props => [
    message,
    donations,
    bloodType,
    lastDonation,
  ];
  }