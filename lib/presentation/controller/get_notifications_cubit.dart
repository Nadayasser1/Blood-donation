import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/domain/entities/get_notifications.dart';
import 'package:graduation/domain/use_cases/get_notifications_use_case.dart';

part 'get_notifications_state.dart';

class GetNotificationsCubit extends Cubit<GetNotificationsState> {
  GetNotificationsCubit({required this.getNotificationsUseCase}) : super(GetNotificationsInitial());
  static GetNotificationsCubit get(context)=>BlocProvider.of(context);

  final GetNotificationsUseCase getNotificationsUseCase ;

  Future<void> getNotifications (GetNotificationsParameters parameters)async{
    emit(GetNotificationsLoadingState());
    final result =await getNotificationsUseCase(parameters);
    result.fold((l) {
      emit(GetNotificationsErrorState(l.message));
    }, (r) {
      emit(GetNotificationsSuccessState(r));
    });
  }
}
