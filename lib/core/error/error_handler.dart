import 'package:chdtask/core/error/api_error.dart';
import 'package:chdtask/core/error/error_model.dart';
import 'package:dio/dio.dart';

enum DataSource {
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultError
}

class ResponseCode {
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int internalServerError = 500;
  static const int notFound = 404;
  static const int apiLogicError = 422;

  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultError = -7;
}

class ResponseMessage {
  static const String noContent =
      ApiErrors.noContent; // success with no data (no content)
  static const String badRequest =
      ApiErrors.badRequestError; // failure, API rejected request
  static const String unauthorized =
      ApiErrors.unauthorizedError; // failure, user is not authorised
  static const String forbidden =
      ApiErrors.forbiddenError; // failure, API rejected request
  static const String internalServerError =
      ApiErrors.internalServerError; // failure, crash in server side
  static const String notFound =
      ApiErrors.notFoundError; // failure, crash in server side

  // local status code
  static const String connectTimeout = ApiErrors.timeoutError;
  static const String cancel = ApiErrors.defaultError;
  static const String receiveTimeout = ApiErrors.timeoutError;
  static const String sendTimeout = ApiErrors.timeoutError;
  static const String cacheError = ApiErrors.cacheError;
  static const String noInternetConnection = ApiErrors.noInternetError;
  static const String defaultError = ApiErrors.defaultError;
}

extension DataSourceExtension on DataSource {
  ApiResponseModel getFailure() {
    switch (this) {
      case DataSource.noContent:
        return const ApiResponseModel(
            message: ResponseMessage.noContent,
            statusMsg: ResponseMessage.noContent);
      case DataSource.badRequest:
        return const ApiResponseModel(
            message: ResponseMessage.badRequest,
            statusMsg: ResponseMessage.badRequest);
      case DataSource.forbidden:
        return const ApiResponseModel(
            message: ResponseMessage.forbidden,
            statusMsg: ResponseMessage.forbidden);
      case DataSource.unauthorized:
        return const ApiResponseModel(
            message: ResponseMessage.unauthorized,
            statusMsg: ResponseMessage.unauthorized);
      case DataSource.notFound:
        return const ApiResponseModel(
            message: ResponseMessage.notFound,
            statusMsg: ResponseMessage.notFound);
      case DataSource.internalServerError:
        return const ApiResponseModel(
          message: ResponseMessage.internalServerError,
          statusMsg: ResponseMessage.internalServerError,
        );
      case DataSource.connectTimeout:
        return const ApiResponseModel(
          message: ResponseMessage.connectTimeout,
          statusMsg: ResponseMessage.connectTimeout,
        );
      case DataSource.cancel:
        return const ApiResponseModel(
            message: ResponseMessage.cancel, statusMsg: ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return const ApiResponseModel(
            message: ResponseMessage.receiveTimeout,
            statusMsg: ResponseMessage.receiveTimeout);
      case DataSource.sendTimeout:
        return const ApiResponseModel(
            message: ResponseMessage.sendTimeout,
            statusMsg: ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return const ApiResponseModel(
            message: ResponseMessage.cacheError,
            statusMsg: ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return const ApiResponseModel(
            message: ResponseMessage.noInternetConnection,
            statusMsg: ResponseMessage.noInternetConnection);
      case DataSource.defaultError:
        return const ApiResponseModel(
            message: ResponseMessage.defaultError,
            statusMsg: ResponseMessage.defaultError);
    }
  }
}

class ErrorHandler implements Exception {
  late ApiResponseModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      apiErrorModel = _handleError(error);
    } else {
      // default error
      apiErrorModel = DataSource.defaultError.getFailure();
    }
  }
}

ApiResponseModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeout.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiResponseModel.fromJson(error.response!.data);
      } else {
        return DataSource.defaultError.getFailure();
      }
    case DioExceptionType.unknown:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiResponseModel.fromJson(error.response!.data);
      } else {
        return DataSource.defaultError.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.defaultError.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.defaultError.getFailure();
  }
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}
