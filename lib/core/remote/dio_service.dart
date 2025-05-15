import 'dart:developer';

import 'package:dio/dio.dart';

class DioService {
  static Future<T> run<T>({
    required Future<Response> Function() request,
    required T Function(dynamic data) parse,
  }) async {
    try {
      final response = await request();
      return parse(response.data);
    } on DioException catch (e, st) {
      log("API CALL", error: e, stackTrace: st, name: 'DioException');
      throw _handleDioError(e);
    } catch (e, st) {
      log("API CALL", error: e, stackTrace: st, name: 'Exception');
      throw Exception('Unknown error occurred');
    }
  }

  static String _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'connection timeout';
      case DioExceptionType.sendTimeout:
        return 'send timeout';
      case DioExceptionType.receiveTimeout:
        return 'receive timeout';
      case DioExceptionType.badCertificate:
        return 'bad certificate';
      case DioExceptionType.badResponse:
        return _handleHttpError(e);
      case DioExceptionType.cancel:
        return 'request cancelled';
      case DioExceptionType.connectionError:
        return 'connection error';
      case DioExceptionType.unknown:
        return 'unknown';
    }
  }

  static String _handleHttpError(DioException e) {
    if (e.response?.data?['message'] != null) {
      return e.response?.data?['message'];
    }
    return e.message ??
        switch (e.response?.statusCode) {
          400 => 'Bad request. Please try again.',
          401 => 'Unauthorized. Please log in again.',
          402 => '402 Payment Required',
          403 => 'Access denied. You don\'t have permission to access this resource.',
          404 => 'The requested resource was not found.',
          405 => 'Method Not Allowed',
          406 => 'Not Acceptable',
          407 => 'Proxy Authentication Required',
          408 => 'Request Timeout',
          409 => 'Conflict',
          429 => 'Too many requests. Please try again later.',
          500 => 'Server error. Please try again later.',
          501 => 'Server error. Please try again later.',
          502 => 'Server error. Please try again later.',
          503 => 'Server error. Please try again later.',
          504 => 'Gateway Timeout',
          505 => 'HTTP Version Not Supported',
          511 => 'Network Authentication Required',
          _ => 'Unknown status code: ${e.response?.statusCode}',
        };
  }
}
