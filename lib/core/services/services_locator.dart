import 'package:get_it/get_it.dart';
import 'package:graduation/data/data_source/remote_data_source/base_remote_data_source.dart';
import 'package:graduation/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:graduation/data/repository/repository.dart';
import 'package:graduation/domain/base_repository/base_repository.dart';
import 'package:graduation/domain/use_cases/login_use_case.dart';

final sl = GetIt.instance;

class ServicesLocator {


  void init(){



    ///Use Cases
    sl.registerLazySingleton(() => LoginUseCase(baseRepository: sl()));

    ///Repository
    sl.registerLazySingleton<BaseRepository>(() => Repository(baseRemoteDataSource: sl()));

    ///Data Source
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());


  }
}