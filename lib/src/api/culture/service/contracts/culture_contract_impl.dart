import 'package:dio/dio.dart';
import 'package:skyscanner_api/src/api/culture/model/response/currency.dart';
import 'package:skyscanner_api/src/api/culture/model/response/nearest_culture.dart';
import 'package:skyscanner_api/src/api/culture/service/contracts/culture_contract.dart';
import 'package:skyscanner_api/src/network/network_exports.dart';

import '../../../../../skyscanner_export.dart';
import '../../model/response/locale.dart';

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
