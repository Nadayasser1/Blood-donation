import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/domain/entities/get_donations.dart';
import 'package:graduation/domain/use_cases/get_donation_use_case.dart';

part 'get_donations_state.dart';

class GetDonationsCubit extends Cubit<GetDonationsState> {
  GetDonationsCubit({required this.getDonationsUseCase}) : super(GetDonationsInitial());
  final GetDonationsUseCase getDonationsUseCase;

  static GetDonationsCubit get(context)=>BlocProvider.of(context);


  Future<void> getDonations (GetDonationsParameters parameters)async{
    emit(GetDonationsLoadingState());
    final result =await getDonationsUseCase(parameters);
    result.fold((l) {
      emit(GetDonationsErrorState(l.message));
    }, (r) {
      emit(GetDonationsSuccessState(r));
    });
  }
}
