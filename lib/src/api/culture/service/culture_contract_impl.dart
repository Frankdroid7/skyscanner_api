import 'package:dio/dio.dart';
import 'package:skyscanner_api/src/api/culture/model/model_exports.dart';
import 'package:skyscanner_api/src/api/culture/model/response/currency.dart';
import 'package:skyscanner_api/src/api/culture/service/contracts/culture_contract.dart';
import 'package:skyscanner_api/src/network/network_exports.dart';

import '../model/response/locale.dart';

class CultureContractImpl extends CultureContract {
  NetworkService networkService = NetworkService();

  @override
  Future<MarketResponse> getMarkets(String locale) async {
    try {
      Response response = await networkService.request(
          path: '${ApiPath.cultureMarkets}/$locale', method: RequestMethod.get);

      return MarketResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<LocaleResponse> getLocales() async {
    try {
      Response response = await networkService.request(
          path: ApiPath.cultureLocales, method: RequestMethod.get);

      return LocaleResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<CurrencyResponse> getCurrencies() async {
    try {
      Response response = await networkService.request(
          path: ApiPath.cultureCurrencies, method: RequestMethod.get);

      return CurrencyResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}