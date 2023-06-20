import 'package:get_it/get_it.dart';
import 'package:graduation/core/services/shared_preferences.dart';
import 'package:graduation/data/data_source/remote_data_source/base_remote_data_source.dart';
import 'package:graduation/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:graduation/data/repository/repository.dart';
import 'package:graduation/domain/base_repository/base_repository.dart';
import 'package:graduation/domain/use_cases/login_use_case.dart';
import 'package:graduation/domain/use_cases/register_use_case.dart';
import 'package:graduation/presentation/controller/login_cubit.dart';
import 'package:graduation/presentation/controller/register_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

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


    ///Use Cases
    sl.registerLazySingleton(() => LoginUseCase(baseRepository: sl()));
    sl.registerLazySingleton(() => RegisterUseCase(baseRepository: sl()));


    ///Repository
    sl.registerLazySingleton<BaseRepository>(() => Repository(baseRemoteDataSource: sl()));

    ///Data Source
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());


  }
}