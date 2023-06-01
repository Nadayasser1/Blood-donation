import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/domain/entities/register.dart';
import 'package:graduation/domain/use_cases/register_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerUseCase}) : super(RegisterInitialState());

  final RegisterUseCase  registerUseCase;


  Future<void> register(RegisterParameters parameters)async {
    emit(RegisterLoadingState());

    final result= await registerUseCase(parameters);

    result.fold((l) {

      emit(RegisterErrorState(
          l.message
      ),);
    }, (r) {
      emit(RegisterSuccessState(r));
    });
  }



}
