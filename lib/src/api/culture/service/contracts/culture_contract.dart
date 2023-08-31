import '../../../../network/network_exports.dart';
import '../../model/currency.dart';
import '../../model/locale.dart';
import '../../model/market.dart';
import '../../model/nearest_culture.dart';

abstract class CultureContract extends NetworkService {
  Future<LocaleResponse> getLocales();
  Future<CurrencyResponse> getCurrencies();
  Future<MarketResponse> getMarkets(String locale);
  Future<NearestCulture> getNearestCulture(String ipAddress);
}
