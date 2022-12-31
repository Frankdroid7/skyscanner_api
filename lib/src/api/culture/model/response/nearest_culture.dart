import 'package:skyscanner_api/src/api/culture/model/response/currency.dart';
import 'package:skyscanner_api/src/api/culture/model/response/locale.dart';
import 'package:skyscanner_api/src/api/culture/model/response/market.dart';

class NearestCulture {
  String? status;
  Market? market;
  Locale? locale;
  Currency? currency;

  NearestCulture({this.status, this.market, this.locale, this.currency});

  NearestCulture.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    market = json['market'] != null ? Market.fromJson(json['market']) : null;
    locale = json['locale'] != null ? Locale.fromJson(json['locale']) : null;
    currency =
        json['currency'] != null ? Currency.fromJson(json['currency']) : null;
  }
}
