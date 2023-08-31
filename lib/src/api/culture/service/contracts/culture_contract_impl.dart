import 'package:dio/dio.dart';

import '../../../../network/network_exports.dart';
import '../../model/currency.dart';
import '../../model/locale.dart';
import '../../model/market.dart';
import '../../model/nearest_culture.dart';
import 'culture_contract.dart';

/// Contract implementations of Culture APIs
class CultureContractImpl extends CultureContract {
  @override
  Future<MarketResponse> getMarkets(String locale) async {
    try {
      Response response = await request(
          path: '${ApiPath.cultureMarkets}/$locale', method: RequestType.get);
      return MarketResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LocaleResponse> getLocales() async {
    try {
      Response response =
          await request(path: ApiPath.cultureLocales, method: RequestType.get);
      return LocaleResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CurrencyResponse> getCurrencies() async {
    try {
      Response response = await request(
          path: ApiPath.cultureCurrencies, method: RequestType.get);
      return CurrencyResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<NearestCulture> getNearestCulture(String ipAddress) async {
    try {
      Response response = await request(
        path: ApiPath.nearestCulture,
        method: RequestType.get,
        queryParams: {'ipAddress': ipAddress},
      );
      return NearestCulture.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
