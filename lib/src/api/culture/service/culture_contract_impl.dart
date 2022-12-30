import 'package:dio/dio.dart';
import 'package:skyscanner_api/src/api/culture/model/model_exports.dart';
import 'package:skyscanner_api/src/api/culture/model/response/currency.dart';
import 'package:skyscanner_api/src/api/culture/service/contracts/culture_contract.dart';
import 'package:skyscanner_api/src/network/network_exports.dart';

import '../model/response/locale.dart';

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
}
