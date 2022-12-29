import 'common_export.dart';

class SkyScannerException implements Exception {
  String? message;

  SkyScannerException(this.message);

  @override
  String toString() => message ?? Strings.unKnownError;
}

class AuthenticationException extends SkyScannerException {
  AuthenticationException(String message) : super(message);
}
