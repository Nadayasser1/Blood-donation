part of 'get_branches_cubit.dart';

abstract class GetBranchesState {}

class GetBranchesInitial extends GetBranchesState {}

class GetBranchesLoadingState extends GetBranchesState{
}

class GetBranchesSuccessState extends GetBranchesState{
  final GetBranches addRequestMessage;

  GetBranchesSuccessState(this.addRequestMessage);

}

class GetBranchesErrorState extends GetBranchesState{
  final String error;

  GetBranchesErrorState(this.error);

}
