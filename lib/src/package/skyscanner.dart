import 'package:skyscanner_api/skyscanner_export.dart';
import 'package:skyscanner_api/src/api/culture/model/response/currency.dart';
import 'package:skyscanner_api/src/api/culture/model/response/locale.dart';
import 'package:skyscanner_api/src/api/culture/model/response/nearest_culture.dart';

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
  /// [apiKey] - your SkyScanner Api key. This is mandatory.
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

  /// Getter for ApiKey
  String get apiKey => _apiKey;

  /// Returns [CurrencyResponse].
  /// Use this method to retrieve the currencies that Skyscanner supports
  /// and information about how Skyscanner formats them.
  Future<CurrencyResponse?> getCurrencies() async =>
      await _scannerManager?.getCurrencies();

  /// Returns [LocaleResponse].
  /// Use this method to retrieve the locales that Skyscanner supports.
  /// The names of the locales returned are in the native language associated with the locale.
  /// You can use the locales to translate the results of the other APIs to fit your content(language).
  Future<LocaleResponse?> getLocales() async =>
      await _scannerManager?.getLocales();

  /// Returns [MarketResponse].
  /// Use this method to retrieve the market countries that Skyscanner supports.
  /// The names of the markets returned are localised based on a locale passed as a parameter.
  Future<MarketResponse?> getMarkets(String locale) async =>
      await _scannerManager?.getMarkets(locale);

  /// Returns a Map of geographical locations in a language determined by the given [locale].
  Future<Map<String, dynamic>?> getGeoFlights(String locale) async =>
      await _scannerManager?.getGeoFlights(locale);

  /// Returns a Map of geographical locations in a language determined by the given [locale] starting from the nearest airport.
  Future<Map<String, dynamic>?> getGeoNearestFlights(
          {required NearestFlight nearestFlight}) async =>
      await _scannerManager?.getGeoNearestFlights(nearestFlight);

  /// Returns [NearestCulture]
  /// Use this method to retrieve the most relevant culture information based on the [ipAddress]
  Future<NearestCulture?> getNearestCulture(String ipAddress) async =>
      await _scannerManager?.getNearestCulture(ipAddress);

  /// Returns a Map of a full list of active carriers with name and IATA code indexed by their carrierId.
  /// The Map contains 'name' - The legal name of the carrier and 'iata' - The IATA code of the carrier.
  Future<Map<String, dynamic>?> getCarriers() async =>
      await _scannerManager?.getCarriers();
}
