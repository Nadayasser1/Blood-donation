import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/domain/entities/add_donation.dart';
import 'package:graduation/domain/use_cases/add_donation_use_case.dart';

part 'add_donation_state.dart';

class AddDonationCubit extends Cubit<AddDonationState> {
  AddDonationCubit({required this.addDonationUseCase}) : super(AddDonationInitial());
  static AddDonationCubit get(context)=>BlocProvider.of(context);

  final AddDonationUseCase addDonationUseCase ;

  Future<void> addDonation (AddDonationParameters parameters)async{
    emit(AddDonationLoadingState());
    final result =await addDonationUseCase(parameters);
    result.fold((l) {
      emit(AddDonationErrorState(l.message));
    }, (r) {
      emit(AddDonationSuccessState(r));
    });
  }

}
