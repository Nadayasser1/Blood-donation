import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/domain/entities/questions_form.dart';
import 'package:graduation/domain/use_cases/send_questions_use_case.dart';

part 'send_questions_state.dart';

class SendQuestionsCubit extends Cubit<SendQuestionsState> {
  SendQuestionsCubit({required this.sendQuestionsUseCase}) : super(SendQuestionsInitial());
  static SendQuestionsCubit get(context)=>BlocProvider.of(context);
  final SendQuestionsUseCase sendQuestionsUseCase ;


  Future<void> sendQuestions (SendQuestionsParameters parameters)async{
    emit(SendQuestionsLoadingState());
    final result =await sendQuestionsUseCase(parameters);
    result.fold((l) {
      emit(SendQuestionsErrorState(
        l.message,
      ));
    }, (r) {
      emit(SendQuestionsSuccessState(r));
    });
  }

}
