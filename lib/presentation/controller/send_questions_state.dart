part of 'send_questions_cubit.dart';

abstract class SendQuestionsState {}

class SendQuestionsInitial extends SendQuestionsState {}


class SendQuestionsLoadingState extends SendQuestionsState {}

class SendQuestionsSuccessState extends SendQuestionsState {
  final QuestionsForm message;

  SendQuestionsSuccessState(this.message);
}

class SendQuestionsErrorState extends SendQuestionsState {
  final String error;

  SendQuestionsErrorState(this.error);
}



