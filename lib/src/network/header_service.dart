import 'dart:io';

import 'package:dio/dio.dart';

mixin HeaderService {
  Map<String, String> _headers(String apiKey) =>
      {HttpHeaders.acceptHeader: 'application/json', 'x-api-key': apiKey};

  Options dioOptions(String apiKey) => Options(headers: _headers(apiKey));

  final String baseUrl = 'https://partners.api.skyscanner.net/apiservices/v3/';
}
