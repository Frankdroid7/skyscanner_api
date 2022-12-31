import 'package:skyscanner_api/src/api/culture/model/model_exports.dart';
import 'package:skyscanner_api/src/api/culture/model/response/currency.dart';
import 'package:skyscanner_api/src/api/culture/model/response/locale.dart';
import 'package:skyscanner_api/src/api/flight/live/model/flight_live_prices_create_response/flight_live_prices_create_response.dart';

import '../api/flight/live/entity/flight_live_prices_create_entity/flight_live_prices_create_entity.dart';
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

  /// Getter ApiKey
  String get apiKey => _apiKey;

  /// Getter for fetching of currencies
  Future<CurrencyResponse?> getCurrencies() async =>
      await _scannerManager?.getCurrencies();

  /// Getter for fetching of locales
  Future<LocaleResponse?> getLocales() async =>
      await _scannerManager?.getLocales();

  /// Getter for fetching of markets
  Future<MarketResponse?> getMarkets(String locale) async =>
      await _scannerManager?.getMarkets(locale);

  /// Getter for creating of live flight
  Future<FlightLivePricesCreateResponse?> createSearchLiveFlight(
          FlightLivePricesCreateEntity entity) async =>
      await _scannerManager?.createSearchLiveFlight(entity);

  /// Getter for search of live poll flight
  Future<FlightLivePricesCreateResponse?> createLiveSearchPoll(
          String sessionToken) async =>
      await _scannerManager?.createLiveSearchPoll(sessionToken);

  /// Getter for creating itinary refresh
  Future<dynamic> createItineraryRefresh(
          String sessionToken, Map<String, dynamic> itineraryId) async =>
      await _scannerManager?.createItineraryRefresh(sessionToken, itineraryId);

  /// Getter for creating itinary refresh
  Future<dynamic> refreshSessionToken(String refreshSessionToken) async =>
      await _scannerManager?.refreshSessionToken(refreshSessionToken);
}
