part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileSuccessState extends ProfileState {

  final UserProfile profileData;
  ProfileSuccessState(this.profileData);

}

class ProfileLoadingState extends ProfileState {
}

class ProfileErrorState extends ProfileState {
  final String error ;
  ProfileErrorState(this.error);
}
