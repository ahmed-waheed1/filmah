import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;
  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      apiErrorModel = ApiErrorHandlerDio.handleError(error);
    } else {
      apiErrorModel = ApiErrorType.unknown.getFailure;
    }
  }
}

class ApiErrorHandlerDio {
  static ApiErrorModel handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel.fromJson(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel.fromJson(error.response?.data);
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel.fromJson(error.response?.data);
        case DioExceptionType.badResponse:
          return ApiErrorModel.fromJson(error.response?.data);
        case DioExceptionType.cancel:
          return ApiErrorModel.fromJson(error.response?.data);
        case DioExceptionType.connectionError:
        case DioExceptionType.badCertificate:
          return ApiErrorModel.fromJson(error.response?.data);
        case DioExceptionType.unknown:
          return ApiErrorModel.fromJson(error.response?.data);
      }
    } else {
      return handleGenericError(error);
    }
  }

  static ApiErrorModel handleGenericError(dynamic error) {
    return ApiErrorModel.fromJson(error.response?.data);
  }
}

enum ApiErrorType {
  success,
  noContent,
  noInternetConnection,
  badRequest,
  notFound,
  unauthorized,
  forbidden,
  internalServerError,
  serviceUnavailable,
  connectionTimeout,
  sendTimeout,
  receiveTimeout,
  badResponse,
  cancel,
  connectionError,
  badCertificate,
  unknown,
}

extension ApiErrorTypeExtension on ApiErrorType {
  ApiErrorModel get getFailure {
    switch (this) {
      case ApiErrorType.success:
        return ApiErrorModel(
          statusCode: ResponseCode.success,
          statusMessage: ResponseMessage.success,
          success: false,
        );
      case ApiErrorType.noContent:
        return ApiErrorModel(
          statusCode: ResponseCode.noContent,
          statusMessage: ResponseMessage.noContent,
          success: false,
        );
      case ApiErrorType.noInternetConnection:
        return ApiErrorModel(
          statusCode: ResponseCode.noInternetConnection,
          statusMessage: ResponseMessage.noInternetConnection,
          success: false,
        );
      case ApiErrorType.badRequest:
        return ApiErrorModel(
          statusCode: ResponseCode.badRequest,
          statusMessage: ResponseMessage.badRequest,
          success: false,
        );
      case ApiErrorType.notFound:
        return ApiErrorModel(
          statusCode: ResponseCode.notFound,
          statusMessage: ResponseMessage.notFound,
          success: false,
        );
      case ApiErrorType.unauthorized:
        return ApiErrorModel(
          statusCode: ResponseCode.unauthorized,
          statusMessage: ResponseMessage.unauthorized,
          success: false,
        );
      case ApiErrorType.forbidden:
        return ApiErrorModel(
          statusCode: ResponseCode.forbidden,
          statusMessage: ResponseMessage.forbidden,
          success: false,
        );
      case ApiErrorType.internalServerError:
        return ApiErrorModel(
          statusCode: ResponseCode.internalServerError,
          statusMessage: ResponseMessage.internalServerError,
          success: false,
        );
      case ApiErrorType.serviceUnavailable:
        return ApiErrorModel(
          statusCode: ResponseCode.serviceUnavailable,
          statusMessage: ResponseMessage.serviceUnavailable,
          success: false,
        );
      case ApiErrorType.connectionTimeout:
        return ApiErrorModel(
          statusCode: ResponseCode.connectionTimeout,
          statusMessage: ResponseMessage.connectionTimeout,
          success: false,
        );
      case ApiErrorType.sendTimeout:
        return ApiErrorModel(
          statusCode: ResponseCode.sendTimeout,
          statusMessage: ResponseMessage.sendTimeout,
          success: false,
        );
      case ApiErrorType.receiveTimeout:
        return ApiErrorModel(
          statusCode: ResponseCode.receiveTimeout,
          statusMessage: ResponseMessage.receiveTimeout,
          success: false,
        );
      case ApiErrorType.badResponse:
        return ApiErrorModel(
          statusCode: ResponseCode.badResponse,
          statusMessage: ResponseMessage.badResponse,
          success: false,
        );
      case ApiErrorType.cancel:
        return ApiErrorModel(
          statusCode: ResponseCode.cancel,
          statusMessage: ResponseMessage.cancel,
          success: false,
        );
      case ApiErrorType.connectionError:
        return ApiErrorModel(
          statusCode: ResponseCode.connectionError,
          statusMessage: ResponseMessage.connectionError,
          success: false,
        );
      case ApiErrorType.badCertificate:
        return ApiErrorModel(
          statusCode: ResponseCode.badCertificate,
          statusMessage: ResponseMessage.badCertificate,
          success: false,
        );
      case ApiErrorType.unknown:
        return ApiErrorModel(
          statusCode: ResponseCode.unknown,
          statusMessage: ResponseMessage.unknown,
          success: false,
        );
    }
  }
}

class ResponseCode {
  static const int success = 200;
  static const int noContent = 204;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int internalServerError = 500;
  static const int serviceUnavailable = 503;
  static const int connectionTimeout = 408;
  static const int sendTimeout = 408;
  static const int receiveTimeout = 408;
  static const int badResponse = 422;
  static const int cancel = 499;
  static const int connectionError = 599;
  static const int badCertificate = 495;
  static const int unknown = 520;
  static const int noInternetConnection = 0;
}

class ResponseMessage {
  static const String success = 'Success';
  static const String noContent = 'No Content, nothing to display.';
  static const String badRequest = 'Bad Request, please check your request.';
  static const String unauthorized = 'Unauthorized, please login again.';
  static const String forbidden = 'Forbidden, you don\'t have permission.';
  static const String notFound = 'Not Found (404), the resource was not found.';
  static const String internalServerError =
      'Internal Server Error, please try again later.';
  static const String serviceUnavailable =
      'Service Unavailable, please try again later.';
  static const String connectionTimeout =
      'Connection Timeout, please try again later.';
  static const String sendTimeout = 'Send Timeout, please try again later.';
  static const String receiveTimeout =
      'Receive Timeout, please try again later.';
  static const String badResponse = 'Bad Response, please try again later.';
  static const String cancel = 'Request Cancelled, please try again later.';
  static const String connectionError =
      'Connection Error, please try again later.';
  static const String badCertificate =
      'Bad Certificate, please try again later.';
  static const String unknown = 'Unknown Error, please try again later.';
  static const String noInternetConnection =
      'No Internet Connection, please check your connection.';
}
