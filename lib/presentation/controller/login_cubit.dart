import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/domain/entities/login.dart';
import 'package:graduation/domain/use_cases/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitialState());

  final LoginUseCase loginUseCase;

  static LoginCubit get(context)=>BlocProvider.of(context);

  Future<void> login(LoginParameters parameters) async{
    emit(LoginLoadingState());
    final result =await loginUseCase(parameters);
    result.fold((l){
      emit(LoginErrorState(
        l.message,
      ));
    }, (r) {
      emit(LoginSuccessState(r));
    });
  }


}
