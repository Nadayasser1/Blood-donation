part of 'get_requests_cubit.dart';

abstract class GetRequestsState {}

class GetRequestsInitial extends GetRequestsState {}

class GetRequestLoadingState extends GetRequestsState{
}

class GetRequestSuccessState extends GetRequestsState{
  final GetRequest getRequestData;

  GetRequestSuccessState(this.getRequestData);


}

class GetRequestErrorState extends GetRequestsState{
  final String error;

  GetRequestErrorState(this.error);

}