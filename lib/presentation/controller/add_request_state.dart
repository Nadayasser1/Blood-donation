part of 'add_request_cubit.dart';


abstract class AddRequestState {}

class AddRequestInitial extends AddRequestState {}




class AddRequestLoadingState extends AddRequestState{
}

class AddRequestSuccessState extends AddRequestState{
  final AddRequest addRequestMessage;

  AddRequestSuccessState(this.addRequestMessage);

}

class AddRequestErrorState extends AddRequestState{
  final String error;

  AddRequestErrorState(this.error);

}

