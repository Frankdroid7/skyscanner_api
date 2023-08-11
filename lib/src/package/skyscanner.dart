import 'package:skyscanner_api/skyscanner_export.dart';
import 'package:skyscanner_api/src/api/culture/model/response/currency.dart';
import 'package:skyscanner_api/src/api/culture/model/response/locale.dart';
import 'package:skyscanner_api/src/api/culture/model/response/nearest_culture.dart';
import 'package:skyscanner_api/src/api/flight/live/model/flight_live_prices_create_response/flight_live_prices_create_response.dart';

import '../api/geo/model/geo_flight_response.dart';
import '../common/common_export.dart';
import '../manager/manager_exports.dart';

class SkyScannerApi {
  String _apiKey = "";
  SkyScannerManager? _scannerManager;

  static final SkyScannerApi _singleton = SkyScannerApi.createInstance();
  SkyScannerApi.createInstance();

  factory SkyScannerApi() => _singleton;

  /// Getter for ApiKey
  String get apiKey => _apiKey;

  /// Initialize the SkyScanner object. It should be called as early as possible
  /// (preferably in initState() of the Widget.
  /// [apiKey] - your SkyScanner Api key. This is mandatory.
  Future<void> initializeApiKey({required String apiKey}) async {
    assert(() {
      if (apiKey.isEmpty || apiKey.length < 32) {
        throw AuthenticationException(Utils.getApiKeyErrorMsg('ApiKey'));
      }

      // if (!apiKey.startsWith("prt") || apiKey.length != 32) {
      //   throw AuthenticationException(Utils.getApiKeyErrorMsg('ApiKey'));
      // }

      return true;
    }());

    _apiKey = apiKey;

    /// Initialize scanner manager
    _scannerManager = SkyScannerManager();
  }

  /// Resets the value of the api key to be empty
  void dispose() => _apiKey = "";

  /*Carriers API methods*/
  /// Returns a Map of a full list of active carriers with name and IATA code indexed by their carrierId.
  /// The Map contains 'name' - The legal name of the carrier and 'iata' - The IATA code of the carrier.
  Future<Map<String, dynamic>?> getCarriers() async =>
      await _scannerManager?.getCarriers();

  /*Referral API methods*/
  /// Returns a map of a full list of referrals for cars
  Future<Map<String, dynamic>?> getCarsDayView(
          {ReferralEntity? entity}) async =>
      await _scannerManager?.getCarsDayView(entity: entity);

  /// Returns a map of a full list of referrals for flights
  Future<Map<String, dynamic>?> getFlightsDayView(
          {ReferralEntity? entity}) async =>
      await _scannerManager?.getFlightsDayView(entity: entity);

  /*Flights Live API methods*/
  /// Getter for search of live poll flight
  Future<FlightLivePricesCreateResponse?> createLiveSearchPoll(
          String sessionToken) async =>
      await _scannerManager?.createLiveSearchPoll(sessionToken);

  /// Getter for creating of live flight
  Future<FlightLivePricesCreateResponse?> createSearchLiveFlight(
          FlightLivePricesCreateEntity entity) async =>
      await _scannerManager?.createSearchLiveFlight(entity);

  /// Getter for creating itinary refresh
  Future<dynamic> createItineraryRefresh(
          String sessionToken, Map<String, dynamic> itineraryId) async =>
      await _scannerManager?.createItineraryRefresh(sessionToken, itineraryId);

  /// Getter for creating itinary refresh
  Future<dynamic> refreshSessionToken(String refreshSessionToken) async =>
      await _scannerManager?.refreshSessionToken(refreshSessionToken);

  /*Flights Indicative API methods*/
  /// Getter for indicative search
  Future<dynamic> indicativeSearch(IndicativeSearchEntity entity) async =>
      await _scannerManager?.indicativeSearch(entity);

  /*Culture API methods*/
  /// Returns [LocaleResponse].
  /// Use this method to retrieve the locales that Skyscanner supports.
  /// The names of the locales returned are in the native language associated with the locale.
  /// You can use the locales to translate the results of the other APIs to fit your content(language).
  Future<LocaleResponse?> getLocales() async =>
      await _scannerManager?.getLocales();

  /// Returns [CurrencyResponse].
  /// Use this method to retrieve the currencies that Skyscanner supports
  /// and information about how Skyscanner formats them.
  Future<CurrencyResponse?> getCurrencies() async =>
      await _scannerManager?.getCurrencies();

  /// Returns [MarketResponse].
  /// Use this method to retrieve the market countries that Skyscanner supports.
  /// The names of the markets returned are localised based on a locale passed as a parameter.
  Future<MarketResponse?> getMarkets(String locale) async =>
      await _scannerManager?.getMarkets(locale);

  /// Returns [NearestCulture]
  /// Use this method to retrieve the most relevant culture information based on the [ipAddress]
  Future<NearestCulture?> getNearestCulture(String ipAddress) async =>
      await _scannerManager?.getNearestCulture(ipAddress);

  /*Autosuggest API methods*/
  /// Returns [CarHireResponse].
  /// Returns a list of places where car hires are available through the 'places' property.
  Future<CarHireResponse?> getCarHire(
          {required CarHireEntity carHireEntity}) async =>
      await _scannerManager?.getCarHire(carHireEntity);

  /// Returns [AutosuggestFlightResponse].
  /// Returns a list of places where flights are available through the 'places' property.
  Future<AutosuggestFlightResponse?> getAutosuggestFlight(
          {required AutosuggestFlightEntity autosuggestFlightEntity}) async =>
      await _scannerManager?.getAutosuggestFlight(autosuggestFlightEntity);

  /// Returns [HotelResponse].
  /// Returns a list of places where hotels are available through the 'places' property.
  Future<HotelResponse?> getHotel({required HotelEntity hotelEntity}) async =>
      await _scannerManager?.getHotel(hotelEntity);

  /*Geo API methods*/
  /// Returns a Map of geographical locations in a language determined by the given [locale].
  Future<GeoFlightResponse?> getGeoFlights(String locale) async =>
      await _scannerManager?.getGeoFlights(locale);

  /// Returns a Map of geographical locations in a language determined by the given [locale] starting from the nearest airport.
  Future<Map<String, dynamic>?> getGeoNearestFlights(
          {required NearestFlightEntity nearestFlight}) async =>
      await _scannerManager?.getGeoNearestFlights(nearestFlight);
}
