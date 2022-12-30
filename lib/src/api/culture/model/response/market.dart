class MarketResponse {
  String? status;
  List<MarketResponse>? markets;

  MarketResponse({this.status, this.markets});

  MarketResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['markets'] != null) {
      markets = <MarketResponse>[];
      json['markets'].forEach((v) {
        markets!.add(MarketResponse.fromJson(v));
      });
    }
  }
}

/// Market countries that Skyscanner supports.
class Market {
  /// Market code, e.g.: UK
  String? code;

  /// The market name, e.g.: United Kingdom
  String? name;

  /// The currency of the 'Market'
  String? currency;

  Market({this.code, this.name, this.currency});

  Market.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    currency = json['currency'];
  }
}
