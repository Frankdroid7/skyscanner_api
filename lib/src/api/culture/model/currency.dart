class CurrencyResponse {
  String? status;
  List<Currency>? currencies;

  CurrencyResponse({this.status, this.currencies});

  CurrencyResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['currencies'] != null) {
      currencies = <Currency>[];
      json['currencies'].forEach((v) {
        currencies!.add(Currency.fromJson(v));
      });
    }
  }
}

/// Currency that Skyscanner supports and information about how Skyscanner formats them.
class Currency {
  /// Currency code, e.g.: GBP for the Pound
  String? code;

  /// Currency symbol, e.g.: £
  String? symbol;

  /// The string for thousands separation
  String? thousandsSeparator;

  /// The string for decimal separation
  String? decimalSeparator;

  /// Whether to show the currency symbol on the left or right.
  bool? symbolOnLeft;

  /// Whether to include a space between the amount and symbol.
  bool? spaceBetweenAmountAndSymbol;

  /// The number of digits shown after the decimal separator
  int? decimalDigits;

  Currency(
      {this.code,
      this.symbol,
      this.thousandsSeparator,
      this.decimalSeparator,
      this.symbolOnLeft,
      this.spaceBetweenAmountAndSymbol,
      this.decimalDigits});

  Currency.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    symbol = json['symbol'];
    thousandsSeparator = json['thousandsSeparator'];
    decimalSeparator = json['decimalSeparator'];
    symbolOnLeft = json['symbolOnLeft'];
    spaceBetweenAmountAndSymbol = json['spaceBetweenAmountAndSymbol'];
    decimalDigits = json['decimalDigits'];
  }
}
