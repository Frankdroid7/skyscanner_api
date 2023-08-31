import 'currency.dart';
import 'market.dart';
import 'locale.dart';

class NearestCulture {
  String? status;
  Market? market;
  LocaleData? localeData;
  Currency? currency;

  NearestCulture({this.status, this.market, this.localeData, this.currency});

  NearestCulture.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    market = json['market'] != null ? Market.fromJson(json['market']) : null;
    localeData =
        json['locale'] != null ? LocaleData.fromJson(json['locale']) : null;
    currency =
        json['currency'] != null ? Currency.fromJson(json['currency']) : null;
  }
}
