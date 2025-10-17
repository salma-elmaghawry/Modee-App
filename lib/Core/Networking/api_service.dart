import 'dart:io';

import 'package:dio/dio.dart';
import 'package:markatty/Core/Networking/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, {this.statusCode});

  @override
  String toString() =>
      'ApiException(statusCode: $statusCode, message: $message)';
}

class ApiService {
  final Dio dio;

  ApiService(this.dio) {
    dio.options.baseUrl = ApiConstants.apiBaseUrl;
    _initializeHeaders();
    // Set sensible timeouts
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);
    dio.options.sendTimeout = const Duration(seconds: 10);

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: false,
        maxWidth: 90,
      ),
    );
  }

  Future<void> _initializeHeaders() async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  // set token after login
  Future<void> setTokenAfterLogin(String token) async {
    dio.options.headers = {'Authorization': 'Bearer $token'};
  }

  // Generic wrappers that translate Dio errors into ApiException
  Future<Response> post(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      return await dio.post(endpoint, data: data);
    } on DioException catch (e) {
      throw _mapDioErrorToApiException(e);
    } on SocketException catch (e) {
      throw ApiException('No Internet connection: ${e.message}');
    }
  }

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await dio.get(endpoint, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw _mapDioErrorToApiException(e);
    } on SocketException catch (e) {
      throw ApiException('No Internet connection: ${e.message}');
    }
  }

  Future<Response> put(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      return await dio.put(endpoint, data: data);
    } on DioException catch (e) {
      throw _mapDioErrorToApiException(e);
    } on SocketException catch (e) {
      throw ApiException('No Internet connection: ${e.message}');
    }
  }

  Future<Response> delete(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      return await dio.delete(endpoint, data: data);
    } on DioException catch (e) {
      throw _mapDioErrorToApiException(e);
    } on SocketException catch (e) {
      throw ApiException('No Internet connection: ${e.message}');
    }
  }

  Future<Response> patch(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      return await dio.patch(endpoint, data: data);
    } on DioException catch (e) {
      throw _mapDioErrorToApiException(e);
    } on SocketException catch (e) {
      throw ApiException('No Internet connection: ${e.message}');
    }
  }

  ApiException _mapDioErrorToApiException(DioException e) {
    if (e.type == DioExceptionType.badResponse) {
      final response = e.response;
      final status = response?.statusCode;
      final message =
          response?.data?.toString() ?? e.message ?? 'Unknown API error';
      return ApiException(message, statusCode: status);
    }

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return ApiException('Request timed out');
    }

    if (e.type == DioExceptionType.badCertificate ||
        e.type == DioExceptionType.cancel) {
      return ApiException(
        e.message ?? 'Request cancelled or certificate issue',
      );
    }

    return ApiException(e.message ?? 'Network error');
  }
}
