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

class Markets {
  String? code;
  String? name;
  String? currency;

  Markets({this.code, this.name, this.currency});

  Markets.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    currency = json['currency'];
  }
}
