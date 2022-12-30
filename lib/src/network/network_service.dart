import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:skyscanner_api/skyscanner_export.dart';
import 'api_error.dart';
import 'header_service.dart';

/// Requests types
enum RequestMethod { post, get, put, delete, upload }

/// description: A network provider wrapper class which manages network connections
/// between the app and external services. This is a wrapper around [Dio].
///
/// Using this class automatically handle, token management, logging, global
class NetworkService with HeaderService {
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
  Dio? dio;

  /// Returns the current build status of the application
  bool get _isDebugMode => kDebugMode;

  NetworkService() {
    _initialiseDio();
  }

  /// Initialize essential class properties
  void _initialiseDio() {
    dio = Dio(BaseOptions(
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        baseUrl: baseUrl));
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

  Future<Response> request({
    required String path,
    required RequestMethod method,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
    FormData? formData,
  }) async {
    Response response;
    var params = queryParams ?? {};
    if (params.keys.contains("searchTerm")) {
      params["searchTerm"] = Uri.encodeQueryComponent(params["searchTerm"]);
    }
    SkyScannerApi skyScannerApi = SkyScannerApi();
    try {
      switch (method) {
        case RequestMethod.post:
          response = await dio!.post(path,
              queryParameters: params,
              data: data,
              options: dioOptions(skyScannerApi.apiKey));
          break;
        case RequestMethod.get:
          response = await dio!.get(path,
              queryParameters: params,
              options: dioOptions(skyScannerApi.apiKey));

          break;
        case RequestMethod.put:
          response = await dio!.put(path,
              queryParameters: params,
              data: data,
              options: dioOptions(skyScannerApi.apiKey));
          break;
        case RequestMethod.delete:
          response = await dio!.delete(path,
              queryParameters: params,
              data: data,
              options: dioOptions(skyScannerApi.apiKey));
          break;
        case RequestMethod.upload:
          response = await dio!.post(path,
              data: formData,
              queryParameters: params,
              options: dioOptions(skyScannerApi.apiKey),
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
