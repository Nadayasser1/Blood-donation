import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/use_cases/user_profile_use_case.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileUseCase}) : super(ProfileInitial());

  final UserProfileUseCase profileUseCase;
  static ProfileCubit get(context)=>BlocProvider.of(context);

  Future<void> getProfile(UserProfileParameters parameters) async{
    emit(ProfileLoadingState());

    final result = await profileUseCase(parameters);
    result.fold((l){

      emit(ProfileErrorState(
        l.message,
      ));
    }, (r) {
      emit(ProfileSuccessState(r));
    });
  }


}
