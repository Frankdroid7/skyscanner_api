import 'package:dio/dio.dart';
import '../common/common_export.dart';

/// Helper class for converting [DioError] into readable formats
class ApiError {
  int? errorType = 0;

  final logger = getLogger('ApiError');

  /// description of error generated this is similar to convention [Error.message]
  String? errorDescription;

  ApiError({this.errorDescription});

  ApiError.fromDio(Object dioError) {
    _handleError(dioError);
  }

  /// sets value of class properties from [error]
  void _handleError(Object error) {
    if (error is DioError) {
      DioError dioError = error; // as DioError;
      switch (dioError.type) {
        case DioErrorType.cancel:
          errorDescription = Strings.connectionCancelled;
          break;
        case DioErrorType.connectTimeout:
          errorDescription = Strings.connectTimeout;
          break;
        case DioErrorType.other:
          errorDescription = Strings.connectionFailed;
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = Strings.timeout;
          break;
        case DioErrorType.sendTimeout:
          errorDescription = Strings.sendingTimeout;
          break;
        case DioErrorType.response:
          errorType = dioError.response?.statusCode;
          errorDescription = _handleErrorFromStatusCode(dioError.response);
          break;
      }
    } else {
      errorDescription = Strings.unknownNetworkError;
    }
  }

  @override
  String toString() => '$errorDescription';

  String? _handleErrorFromStatusCode(Response? response) {
    String? message;
    switch (response?.statusCode) {
      case 400:
      case 403:
      case 409:
      case 401:
      case 422:
      case 500:
        message = Strings.serverFailure;
        break;
      default:
    }
    return message ?? response?.data?.toString();
  }
}
