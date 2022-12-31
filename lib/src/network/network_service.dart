import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'api_error.dart';
import 'header_service.dart';

/// Requests types
enum RequestType { post, get, put, delete, upload }

/// description: A network provider wrapper class which manages network connections
/// between the app and external services. This is a wrapper around [Dio].
///
/// Using this class automatically handles token management, logging, global
class NetworkService with HeaderService {
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
  Dio? dio;
  String? mbaseUrl;

  /// Returns the current build status of the application
  bool get _isDebugMode => kDebugMode;

  NetworkService({this.mbaseUrl}) {
    _initialiseDio();
  }

  /// Initialize essential class properties
  void _initialiseDio() {
    dio = Dio(BaseOptions(
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        baseUrl: mbaseUrl ?? baseUrl));
    dio!.interceptors
      ..add(LogInterceptor(requestBody: true))
      ..add(PrettyDioLogger(
          requestHeader: _isDebugMode,
          requestBody: _isDebugMode,
          responseBody: _isDebugMode,
          responseHeader: _isDebugMode,
          error: _isDebugMode,
          compact: _isDebugMode,
          maxWidth: 90));
  }

  /// Factory constructor used mainly for injecting an instance of [Dio] mock
  NetworkService.test(this.dio);

  Future<Response> request(
      {required String path,
      required RequestType method,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? data,
      FormData? formData}) async {
    Response response;

    try {
      switch (method) {
        case RequestType.post:
          response = await dio!.post(path,
              queryParameters: queryParams, data: data, options: dioOptions);
          break;
        case RequestType.get:
          response = await dio!
              .get(path, queryParameters: queryParams, options: dioOptions);

          break;
        case RequestType.put:
          response = await dio!.put(path,
              queryParameters: queryParams, data: data, options: dioOptions);
          break;
        case RequestType.delete:
          response = await dio!.delete(path,
              queryParameters: queryParams, data: data, options: dioOptions);
          break;
        case RequestType.upload:
          response = await dio!.post(path,
              data: formData,
              queryParameters: queryParams,
              options: dioOptions,
              onSendProgress: (sent, total) {});
          break;
      }
      return response;
    } catch (error, stackTrace) {
      var apiError = ApiError.fromDio(error);
      return Future.error(apiError, stackTrace);
    }
  }
}
