part of 'login_cubit.dart';

abstract class LoginState {}


class LoginInitialState extends LoginState{}

class LoginLoadingState extends LoginState{
}

class LoginSuccessState extends LoginState{
  final Login loginData;

  LoginSuccessState(this.loginData);
}

class LoginErrorState extends LoginState{
  final String error;

  LoginErrorState(this.error);
}

class LoginPasswordState extends LoginState{}
