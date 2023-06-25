import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/domain/entities/get_request.dart';
import 'package:graduation/domain/use_cases/get_request_use_case.dart';

part 'get_requests_state.dart';

class GetRequestsCubit extends Cubit<GetRequestsState> {
  GetRequestsCubit({required this.getRequestUseCase}) : super(GetRequestsInitial());

  static GetRequestsCubit get(context)=>BlocProvider.of(context);

  final GetRequestUseCase getRequestUseCase ;


  Future<void>getRequests (GetRequestParameters parameters)async{
    emit(GetRequestLoadingState());
    final result =await getRequestUseCase(parameters);
    result.fold((l) {
      emit(GetRequestErrorState(l.message));

    }, (r) {

      emit(GetRequestSuccessState(r));
    });
  }
}
