part of 'login_cubit.dart';
@immutable
abstract class LoginState {}


class LoginInitialState extends LoginState{}

class LoginLoadingState extends LoginState{
}

class LoginSuccessState extends LoginState{
  final Login loginDat;

  LoginSuccessState(this.loginDat);
}

class LoginErrorState extends LoginState{
  final String error;

  LoginErrorState(this.error);
}
