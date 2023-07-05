
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/core/base_use_case/base_use_case.dart';
import 'package:graduation/domain/entities/get-branches.dart';
import 'package:graduation/domain/use_cases/get_branches_use_case.dart';

part 'get_branches_state.dart';

class GetBranchesCubit extends Cubit<GetBranchesState> {
  GetBranchesCubit({required this.getBranchesUseCase}) : super(GetBranchesInitial());
  final GetBranchesUseCase getBranchesUseCase;
  static GetBranchesCubit get(context)=>BlocProvider.of(context);

  Future<void> getBranches(NoParameters parameters)async{
    emit(GetBranchesLoadingState());
    final result=await getBranchesUseCase(parameters);
    result.fold((l) {
      emit(GetBranchesErrorState(l.message));
    }, (r) {
      emit(GetBranchesSuccessState(r));
    });

  }

}
