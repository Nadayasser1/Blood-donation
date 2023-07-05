part of 'get_donations_cubit.dart';


abstract class GetDonationsState {}

class GetDonationsInitial extends GetDonationsState {}

class GetDonationsLoadingState extends GetDonationsState{
}

class GetDonationsSuccessState extends GetDonationsState{
  final GetDonations addRequestMessage;

  GetDonationsSuccessState(this.addRequestMessage);

}

class GetDonationsErrorState extends GetDonationsState{
  final String error;

  GetDonationsErrorState(this.error);

}

