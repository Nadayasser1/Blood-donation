import 'package:get_it/get_it.dart';
import 'package:graduation/core/services/shared_preferences.dart';
import 'package:graduation/data/data_source/remote_data_source/base_remote_data_source.dart';
import 'package:graduation/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:graduation/data/repository/repository.dart';
import 'package:graduation/domain/base_repository/base_repository.dart';
import 'package:graduation/domain/use_cases/add_donation_use_case.dart';
import 'package:graduation/domain/use_cases/get_request_use_case.dart';
import 'package:graduation/domain/use_cases/login_use_case.dart';
import 'package:graduation/domain/use_cases/register_use_case.dart';
import 'package:graduation/domain/use_cases/send_questions_use_case.dart';
import 'package:graduation/domain/use_cases/user_profile_use_case.dart';
import 'package:graduation/presentation/controller/add_donation_cubit.dart';
import 'package:graduation/presentation/controller/add_request_cubit.dart';
import 'package:graduation/presentation/controller/get_requests_cubit.dart';
import 'package:graduation/presentation/controller/login_cubit.dart';
import 'package:graduation/presentation/controller/profile_cubit.dart';
import 'package:graduation/presentation/controller/register_cubit.dart';
import 'package:graduation/presentation/controller/send_questions_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/use_cases/add_request_use_case.dart';

final sl = GetIt.instance;

class ServicesLocator {


  void init() async{

    final sharedPrefs =await SharedPreferences.getInstance();

    ///shared prefs instance
    sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

    /// app prefs instance
    sl.registerLazySingleton<AppPreferences>(() => AppPreferences(sl()));


    ///Cubit
    sl.registerFactory(()=> LoginCubit( loginUseCase: sl()));

    sl.registerFactory(() => RegisterCubit(registerUseCase: sl()));

    sl.registerFactory(()=> ProfileCubit(profileUseCase: sl()));

    sl.registerFactory(()=> AddRequestCubit(addRequestUseCase: sl()));

    sl.registerFactory(()=> GetRequestsCubit(getRequestUseCase: sl() ));

    sl.registerFactory(()=> AddDonationCubit(addDonationUseCase: sl() ));

    sl.registerFactory(()=> SendQuestionsCubit( sendQuestionsUseCase: sl() ));







    ///Use Cases
    sl.registerLazySingleton(() => LoginUseCase(baseRepository: sl()));
    sl.registerLazySingleton(() => RegisterUseCase(baseRepository: sl()));
    sl.registerLazySingleton(() => UserProfileUseCase(baseRepository: sl()));
    sl.registerLazySingleton(() => AddRequestUseCase(baseRepository: sl())) ;
    sl.registerLazySingleton(() => GetRequestUseCase(baseRepository: sl())) ;
    sl.registerLazySingleton(() => AddDonationUseCase(baseRepository: sl())) ;
    sl.registerLazySingleton(() => SendQuestionsUseCase(baseRepository: sl())) ;





    ///Repository
    sl.registerLazySingleton<BaseRepository>(() => Repository(baseRemoteDataSource: sl()));

    ///Data Source
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());


  }
}