import 'package:skyscanner_api/src/api/culture/model/response/currency.dart';
import 'package:skyscanner_api/src/api/culture/model/response/locale.dart';

import '../../model/model_exports.dart';

abstract class CultureContract {
  Future<LocaleResponse> getLocales();
  Future<CurrencyResponse> getCurrencies();
  Future<MarketResponse> getMarkets(String locale);
}
