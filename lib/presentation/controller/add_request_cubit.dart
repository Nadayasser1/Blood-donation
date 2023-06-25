import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/domain/entities/add_request.dart';

import '../../domain/use_cases/add_request_use_case.dart';

part 'add_request_state.dart';

class AddRequestCubit extends Cubit<AddRequestState> {
  AddRequestCubit({required this.addRequestUseCase}) : super(AddRequestInitial());

  static AddRequestCubit get(context)=>BlocProvider.of(context);


  final AddRequestUseCase addRequestUseCase;


  Future<void> addRequest (AddRequestParameters parameters)async{
     emit(AddRequestLoadingState());
    final result= await addRequestUseCase(parameters);
    result.fold((l) {
      emit(AddRequestErrorState(l.message));
    }, (r) {
      emit(AddRequestSuccessState(r));
    });
  }
}
