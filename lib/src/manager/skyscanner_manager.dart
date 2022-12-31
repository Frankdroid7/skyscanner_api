import 'package:skyscanner_api/src/api/culture/model/model_exports.dart';
import 'package:skyscanner_api/src/api/culture/model/response/currency.dart';
import 'package:skyscanner_api/src/api/culture/model/response/locale.dart';
import 'package:skyscanner_api/src/api/culture/service/culture_contract_impl.dart';
import 'package:skyscanner_api/src/api/flight/live/entity/flight_live_prices_create_entity/flight_live_prices_create_entity.dart';

import '../api/flight/live/contract/flight_live_contract_impl.dart';
import '../api/flight/live/model/flight_live_prices_create_response/flight_live_prices_create_response.dart';

/// Wrapper class to manage all of Skyscanner Contract Implementations
class SkyScannerManager {
  final CultureContractImpl _cultureContractImpl = CultureContractImpl();
  final FlightLiveContractImpl _flightLiveContractImpl =
      FlightLiveContractImpl();

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
}
