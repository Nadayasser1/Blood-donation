part of 'add_donation_cubit.dart';

abstract class AddDonationState {}

class AddDonationInitial extends AddDonationState {}


class AddDonationLoadingState extends AddDonationState {}

class AddDonationSuccessState extends AddDonationState {
  final AddDonation message;

  AddDonationSuccessState(this.message);

}

class AddDonationErrorState extends AddDonationState {
  final String error;

  AddDonationErrorState(this.error);
}
