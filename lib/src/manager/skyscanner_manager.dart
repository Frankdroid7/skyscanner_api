import 'package:skyscanner_api/src/api/autosuggest/autosuggest_exports.dart';
import 'package:skyscanner_api/src/api/autosuggest/entity/autosuggest_flight_entity.dart';
import 'package:skyscanner_api/src/api/autosuggest/entity/carhire_entity.dart';
import 'package:skyscanner_api/src/api/autosuggest/entity/hotel_entity.dart';
import 'package:skyscanner_api/src/api/autosuggest/service/contract/autosuggest_contract_impl.dart';
import 'package:skyscanner_api/src/api/carriers/service/contracts/carriers_contract_impl.dart';
import 'package:skyscanner_api/src/api/culture/model/response/currency.dart';
import 'package:skyscanner_api/src/api/culture/model/response/locale.dart';
import 'package:skyscanner_api/src/api/culture/model/response/nearest_culture.dart';
import 'package:skyscanner_api/src/api/culture/service/contracts/culture_contract_impl.dart';
import 'package:skyscanner_api/src/api/geo/service/contracts/geo_contract_impl.dart';

import '../../skyscanner_export.dart';
import '../api/flight/indicative/contract/indicative_search_contract_impl.dart';
import '../api/flight/live/contract/flight_live_contract_impl.dart';
import '../api/flight/live/model/flight_live_prices_create_response/flight_live_prices_create_response.dart';
import '../api/referral/contracts/referal_contract_impl.dart';

mixin ContractImplMixin {
  final FlightLiveContractImpl _flightLiveContractImpl =
      FlightLiveContractImpl();
  final GeoContractImpl _geoContractImpl = GeoContractImpl();
  final IndicativeSearchContractImpl _indicativeSearchContractImpl =
      IndicativeSearchContractImpl();
  final CultureContractImpl _cultureContractImpl = CultureContractImpl();
  final CarriersContractImpl _carriersContractImpl = CarriersContractImpl();
  final ReferralContractImpl _referralContractImpl = ReferralContractImpl();
  final AutosuggestContractImpl _autosuggestContractImpl =
      AutosuggestContractImpl();
}

/// Wrapper class to manage all Skyscanner Contract Implementations.
class SkyScannerManager with ContractImplMixin {
  /*Geo API Methods*/
  /// Fetch nearest geo flights
  Future<Map<String, dynamic>> getGeoNearestFlights(
      NearestFlightEntity nearestFlight) async {
    try {
      return await _geoContractImpl.getGeoNearestFlights(nearestFlight);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Fetch the available geo flights
  Future<Map<String, dynamic>> getGeoFlights(String locale) async {
    try {
      return await _geoContractImpl.getGeoFlights(locale);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /*Culture API Methods*/
  /// Fetch locales
  Future<LocaleResponse> getLocales() async {
    try {
      return await _cultureContractImpl.getLocales();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Fetch currencies
  Future<CurrencyResponse> getCurrencies() async {
    try {
      return await _cultureContractImpl.getCurrencies();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Fetch markets
  Future<MarketResponse> getMarkets(String locale) async {
    try {
      return await _cultureContractImpl.getMarkets(locale);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Fetch nearest cultures
  Future<NearestCulture> getNearestCulture(String ipAddress) async {
    try {
      return await _cultureContractImpl.getNearestCulture(ipAddress);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /*Flight Live API Methods*/
  /// Create a search live poll
  Future<FlightLivePricesCreateResponse> createLiveSearchPoll(
      String sessionToken) async {
    try {
      return await _flightLiveContractImpl.createLiveSearchPoll(sessionToken);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Create a search live flight
  Future<FlightLivePricesCreateResponse> createSearchLiveFlight(
      FlightLivePricesCreateEntity entity) async {
    try {
      return await _flightLiveContractImpl.createLiveFlight(entity);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Create a refresh itineraries
  Future<dynamic> createItineraryRefresh(
      String sessionToken, Map<String, dynamic> itineraryId) async {
    try {
      return await _flightLiveContractImpl.createItineraryRefresh(
          sessionToken, itineraryId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Refresh itineraries session token
  Future<dynamic> refreshSessionToken(String refreshSessionToken) async {
    try {
      return await _flightLiveContractImpl
          .refreshSessionToken(refreshSessionToken);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /*Autosuggest API Methods*/
  /// Fetch autosuggestions for flights
  Future<AutosuggestFlightResponse> getAutosuggestFlight(
      AutosuggestFlightEntity autosuggestFlightEntity) async {
    try {
      return await _autosuggestContractImpl
          .getAutosuggestFlight(autosuggestFlightEntity);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Fetch autosuggestions for Car Hire.
  Future<HotelResponse> getHotel(HotelEntity hotelEntity) async {
    try {
      return await _autosuggestContractImpl.getHotel(hotelEntity);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Fetch autosuggestions for Car Hire.
  Future<CarHireResponse> getCarHire(CarHireEntity carHireEntity) async {
    try {
      return await _autosuggestContractImpl.getCarHire(carHireEntity);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /*Carriers API Methods*/
  /// Fetch carriers
  Future<Map<String, dynamic>> getCarriers() async {
    try {
      return await _carriersContractImpl.getCarriers();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /*Flight Indicative API Methods*/
  /// Indicative Search
  Future<dynamic> indicativeSearch(IndicativeSearchEntity entity) async {
    try {
      return await _indicativeSearchContractImpl.indicativeSearch(entity);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /*Referral API Methods*/
  /// Fetch flights dayview
  Future<Map<String, dynamic>> getFlightsDayView(
      {ReferralEntity? entity}) async {
    try {
      return await _referralContractImpl.getFlightsDayView(entity: entity);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Fetch cars dayview
  Future<Map<String, dynamic>> getCarsDayView({ReferralEntity? entity}) async {
    try {
      return await _referralContractImpl.getCarsDayView(entity: entity);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
