

  import 'package:dio/dio.dart';
import 'package:graduation/core/utils/app-constance.dart';

class DioHelper{

    static Dio dio=Dio();
    static init (){
      dio=Dio(
        BaseOptions(
          baseUrl: AppConstance.baseUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 60), // 60 seconds
          receiveTimeout: const Duration(seconds: 60), // 60 seconds
        ),
      );
    }

    static Future<Response> postData({
       required String path,
    })async
    {
      return dio.post(path);
    }
}





