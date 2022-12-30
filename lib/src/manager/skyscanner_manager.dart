import 'package:skyscanner_api/src/api/culture/model/response/currency.dart';
import 'package:skyscanner_api/src/api/culture/model/response/locale.dart';
import 'package:skyscanner_api/src/api/culture/model/response/nearest_culture.dart';
import 'package:skyscanner_api/src/api/culture/service/culture_contract_impl.dart';
import 'package:skyscanner_api/src/api/geo/service/geo_contract_impl.dart';

import '../../skyscanner_export.dart';

/// Wrapper class to manage all of Skyscanner Contract Implementations
class SkyScannerManager {
  final GeoContractImpl _geoContractImpl = GeoContractImpl();
  final CultureContractImpl _cultureContractImpl = CultureContractImpl();

  Future<CurrencyResponse> getCurrencies() async {
    try {
      return await _cultureContractImpl.getCurrencies();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<LocaleResponse> getLocales() async {
    try {
      return await _cultureContractImpl.getLocales();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<MarketResponse> getMarkets(String locale) async {
    try {
      return await _cultureContractImpl.getMarkets(locale);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>> getGeoFlights(String locale) async {
    try {
      return await _geoContractImpl.getGeoFlights(locale);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>> getGeoNearestFlights(
      NearestFlight nearestFlight) async {
    try {
      return await _geoContractImpl.getGeoNearestFlights(nearestFlight);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<NearestCulture> getNearestCulture(String ipAddress) async {
    try {
      return await _cultureContractImpl.getNearestCulture(ipAddress);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
