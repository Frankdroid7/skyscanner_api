class CurrencyResponse {
  String? status;
  List<Currencies>? currencies;

  CurrencyResponse({this.status, this.currencies});

  CurrencyResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['currencies'] != null) {
      currencies = <Currencies>[];
      json['currencies'].forEach((v) {
        currencies!.add(Currencies.fromJson(v));
      });
    }
  }
}

class Currencies {
  String? code;
  String? symbol;
  String? thousandsSeparator;
  String? decimalSeparator;
  bool? symbolOnLeft;
  bool? spaceBetweenAmountAndSymbol;
  int? decimalDigits;

  Currencies(
      {this.code,
      this.symbol,
      this.thousandsSeparator,
      this.decimalSeparator,
      this.symbolOnLeft,
      this.spaceBetweenAmountAndSymbol,
      this.decimalDigits});

  Currencies.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    symbol = json['symbol'];
    thousandsSeparator = json['thousandsSeparator'];
    decimalSeparator = json['decimalSeparator'];
    symbolOnLeft = json['symbolOnLeft'];
    spaceBetweenAmountAndSymbol = json['spaceBetweenAmountAndSymbol'];
    decimalDigits = json['decimalDigits'];
  }
}
