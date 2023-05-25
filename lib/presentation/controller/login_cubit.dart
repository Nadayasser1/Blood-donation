import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/domain/entities/login.dart';
import 'package:graduation/domain/use_cases/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCase}) : super(LoginInitialState());

  final LoginUseCase loginUseCase;

  static LoginCubit get(context)=>BlocProvider.of(context);

  Future<void> login(LoginParameters parameters) async{
    emit(LoginLoadingState());

    final result = await loginUseCase(parameters);
    result.fold((l){
      emit(LoginErrorState(
        l.message,
      ));
    }, (r) {
      emit(LoginSuccessState(r));
    });
  }

  bool isPassword=true;
  IconData  suffixIcon= Icons.remove_red_eye_outlined;

  void loginPasswordShow (){
    isPassword=!isPassword;
    suffixIcon= isPassword?Icons.remove_red_eye_outlined:Icons.visibility_off_outlined ;
    emit(LoginPasswordState());
  }


}
