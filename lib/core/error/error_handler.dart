
import 'package:dio/dio.dart';
import 'package:graduation/core/error/failure.dart';
import 'package:graduation/core/utils/strings_manager.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  BAD_CERTIFICATE,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handleError(error);
    } else {
      failure = DataSource.DEFAULT.getFailure();
    }
  }

  Failure _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return DataSource.CONNECT_TIMEOUT
            .getFailure(message: error.response!.data['message']);
      case DioErrorType.sendTimeout:
        return DataSource.SEND_TIMEOUT
            .getFailure(message: error.response!.data['message']);
      case DioErrorType.receiveTimeout:
        return DataSource.RECEIVE_TIMEOUT
            .getFailure(message: error.response!.data['message']);
      case DioErrorType.badCertificate:
        return DataSource.BAD_CERTIFICATE
            .getFailure(message: error.response!.data['message']);
      case DioErrorType.badResponse:
        switch (error.response?.statusCode) {
          case ResponseCode.BAD_REQUEST:
            return DataSource.BAD_REQUEST.getFailure(
              message: error.response!.data['message'],
            );
          case ResponseCode.FORBIDDEN:
            return DataSource.FORBIDDEN
                .getFailure(message: error.response!.data['message']);
          case ResponseCode.UNAUTHORIZED:
            return DataSource.UNAUTHORIZED
                .getFailure(message: error.response!.data['message']);
          case ResponseCode.NOT_FOUND:
            return DataSource.NOT_FOUND.getFailure(
              message: error.response!.data['message'],
            );
          case ResponseCode.INTERNAL_SERVER_ERROR:
            return DataSource.INTERNAL_SERVER_ERROR
                .getFailure(message: error.response!.data['message']);
          default:
            return DataSource.DEFAULT.getFailure();
        }
      case DioErrorType.cancel:
        return DataSource.CANCEL
            .getFailure(message: error.response!.data['message']);
      case DioErrorType.connectionError:
        return DataSource.NO_INTERNET_CONNECTION
            .getFailure(message: error.response!.data['message']);
      case DioErrorType.unknown:
        return DataSource.DEFAULT
            .getFailure(message: error.response!.data['message']);
    }
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure({String? message}) {
    switch (this) {
      case DataSource.BAD_REQUEST:
        return Failure(
          message ?? ResponseMessage.BAD_REQUEST,
        );
      case DataSource.FORBIDDEN:
        return Failure(
          message ?? ResponseMessage.FORBIDDEN,
        );
      case DataSource.BAD_CERTIFICATE:
        return Failure(
          message ?? ResponseMessage.BAD_CERTIFICATE,
        );
      case DataSource.UNAUTHORIZED:
        return Failure(
          message ?? ResponseMessage.UNAUTHORIZED,
        );
      case DataSource.NOT_FOUND:
        return Failure(
          message ?? ResponseMessage.NOT_FOUND,
        );
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(
          message ?? ResponseMessage.INTERNAL_SERVER_ERROR,
        );
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
          message ?? ResponseMessage.CONNECT_TIMEOUT,
        );
      case DataSource.CANCEL:
        return Failure(
          message ?? ResponseMessage.CANCEL,
        );
      case DataSource.RECEIVE_TIMEOUT:
        return Failure(
          message ?? ResponseMessage.RECEIVE_TIMEOUT,
        );
      case DataSource.SEND_TIMEOUT:
        return Failure(
          message ?? ResponseMessage.SEND_TIMEOUT,
        );
      case DataSource.CACHE_ERROR:
        return Failure(
          message ?? ResponseMessage.CACHE_ERROR,
        );
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(
          message ?? ResponseMessage.NO_INTERNET_CONNECTION,
        );
      case DataSource.DEFAULT:
        return Failure(
          message ?? ResponseMessage.DEFAULT,
        );
      default:
        return Failure(
          message ?? ResponseMessage.DEFAULT,
        );
    }
  }
}

class ResponseCode {
  // API status codes
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no content
  static const int BAD_REQUEST = 400; // failure, api rejected the request
  static const int FORBIDDEN = 403; // failure, api rejected the request
  static const int BAD_CERTIFICATE = 403; // failure, api rejected the request
  static const int UNAUTHORIZED = 401; // failure user is not authorized
  static const int NOT_FOUND =
      404; // failure, api url is not correct and not found
  static const int INTERNAL_SERVER_ERROR =
      500; // failure, crash happened in server side

  // local status code
  static const int DEFAULT = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
}

class ResponseMessage {
  // API status codes
  // API response codes
  static const String SUCCESS = AppStrings.success; // success with data
  static const String NO_CONTENT =
      AppStrings.noContent; // success with no content
  static const String BAD_REQUEST =
      AppStrings.badRequestError; // failure, api rejected our request
  static const String BAD_CERTIFICATE =
      AppStrings.badCertificate; // failure, api rejected our request
  static const String FORBIDDEN =
      AppStrings.forbiddenError; // failure,  api rejected our request
  static const String UNAUTHORIZED =
      AppStrings.unauthorizedError; // failure, user is not authorized
  static const String NOT_FOUND = AppStrings
      .notFoundError; // failure, API url is not correct and not found in api side.
  static const String INTERNAL_SERVER_ERROR =
      AppStrings.internalServerError; // failure, a crash happened in API side.

  // local responses codes
  static const String DEFAULT =
      AppStrings.defaultError; // unknown error happened
  static const String CONNECT_TIMEOUT =
      AppStrings.timeoutError; // issue in connectivity
  static const String CANCEL =
      AppStrings.defaultError; // API request was cancelled
  static const String RECEIVE_TIMEOUT =
      AppStrings.timeoutError; //  issue in connectivity
  static const String SEND_TIMEOUT =
      AppStrings.timeoutError; //  issue in connectivity
  static const String CACHE_ERROR = AppStrings
      .defaultError; //  issue in getting data from local data source (cache)
  static const String NO_INTERNET_CONNECTION =
      AppStrings.noInternetError; // issue inconnectivity
}

class ApiInternalStatus {
  static const String SUCCESS = "success";
  static const String FAILURE = "fail";
  static const String ERROR = "error";
}
