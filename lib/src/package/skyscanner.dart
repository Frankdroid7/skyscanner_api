import 'package:skyscanner_api/src/api/culture/model/model_exports.dart';
import 'package:skyscanner_api/src/api/culture/model/response/currency.dart';
import 'package:skyscanner_api/src/api/culture/model/response/locale.dart';

import '../common/common_export.dart';
import '../manager/manager_exports.dart';

class SkyScannerApi {
  String _apiKey = "";
  SkyScannerManager? _scannerManager;

  static final SkyScannerApi _singleton = SkyScannerApi.createInstance();
  SkyScannerApi.createInstance();

  factory SkyScannerApi() {
    return _singleton;
  }

  /// Initialize the SkyScanner object. It should be called as early as possible
  /// (preferably in initState() of the Widget.
  ///
  /// [apiKey] - your SkyScanner Api key. This is mandatory
  Future<void> initializeApiKey({required String apiKey}) async {
    assert(() {
      if (apiKey.isEmpty) {
        throw SkyScannerException('apiKey cannot be null or empty');
      }
      if (!apiKey.startsWith("prt") || apiKey.length != 32) {
        throw AuthenticationException(Utils.getApiKeyErrorMsg('ApiKey'));
      }
      return true;
    }());

    _apiKey = apiKey;

    /// Initialize scanner manager
    _scannerManager = SkyScannerManager();
  }

  /// Resets the value of the api key to be empty
  void dispose() {
    _apiKey = "";
  }

  String get apiKey => _apiKey;

  Future<CurrencyResponse?> getCurrencies() async =>
      await _scannerManager?.getCurrencies();
  Future<LocaleResponse?> getLocales() async =>
      await _scannerManager?.getLocales();
  Future<MarketResponse?> getMarkets(String locale) async =>
      await _scannerManager?.getMarkets(locale);
}
