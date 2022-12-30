import 'dart:io';

import 'package:dio/dio.dart';

import '../../skyscanner_export.dart';

mixin HeaderService {
  final SkyScannerApi _skyScannerApi = SkyScannerApi();

  Map<String, String> get _headers => {
        HttpHeaders.acceptHeader: 'application/json',
        'x-api-key': _skyScannerApi.apiKey
      };

  Options get dioOptions => Options(headers: _headers);

  final String baseUrl = 'https://partners.api.skyscanner.net/apiservices/v3/';
}
