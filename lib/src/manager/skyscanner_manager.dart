import 'package:skyscanner_api/src/api/culture/model/model_exports.dart';
import 'package:skyscanner_api/src/api/culture/model/response/currency.dart';
import 'package:skyscanner_api/src/api/culture/model/response/locale.dart';
import 'package:skyscanner_api/src/api/culture/service/culture_contract_impl.dart';
import 'package:skyscanner_api/src/api/flight/indicative/entity/indicative_search_entity/indicative_search_entity.dart';
import 'package:skyscanner_api/src/api/flight/live/entity/flight_live_prices_create_entity/flight_live_prices_create_entity.dart';

import '../api/flight/indicative/contract/indicative_search_contract_impl.dart';
import '../api/flight/live/contract/flight_live_contract_impl.dart';
import '../api/flight/live/model/flight_live_prices_create_response/flight_live_prices_create_response.dart';

/// Wrapper class to manage all of Skyscanner Contract Implementations
class SkyScannerManager {
  final CultureContractImpl _cultureContractImpl = CultureContractImpl();
  final FlightLiveContractImpl _flightLiveContractImpl =
      FlightLiveContractImpl();
  final IndicativeSearchContractImpl _indicativeSearchContractImpl =
      IndicativeSearchContractImpl();

  /// Return currencies
  Future<CurrencyResponse> getCurrencies() async {
    try {
      return await _cultureContractImpl.getCurrencies();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Return locales
  Future<LocaleResponse> getLocales() async {
    try {
      return await _cultureContractImpl.getLocales();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Return markets
  Future<MarketResponse> getMarkets(String locale) async {
    try {
      return await _cultureContractImpl.getMarkets(locale);
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

  /// Create a search live poll
  Future<FlightLivePricesCreateResponse> createLiveSearchPoll(
      String sessionToken) async {
    try {
      return await _flightLiveContractImpl.createLiveSearchPoll(sessionToken);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Create a refresh itinaries
  Future<dynamic> createItineraryRefresh(
      String sessionToken, Map<String, dynamic> itineraryId) async {
    try {
      return await _flightLiveContractImpl.createItineraryRefresh(
          sessionToken, itineraryId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Refresh itinaries session token
  Future<dynamic> refreshSessionToken(String refreshSessionToken) async {
    try {
      return await _flightLiveContractImpl
          .refreshSessionToken(refreshSessionToken);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Indicative Search
  Future<dynamic> indicativeSearch(IndicativeSearchEntity entity) async {
    try {
      return await _indicativeSearchContractImpl.indicativeSearch(entity);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
