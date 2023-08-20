class IndicativePricesResponse {
  String status;
  IndicativePricesContent content;

  IndicativePricesResponse({required this.status, required this.content});
}

class IndicativePricesContent {
  _Result? result;
  _GroupingOptions? groupingOptions;

  IndicativePricesContent({this.result, this.groupingOptions});
}

class _Result {
  _Quotes? quotes;
  _IndicativePricesCarriers? carriers;
  IndicativePricesPlaces? places;

  _Result({this.quotes, this.carriers, this.places});
}

class _IndicativePricesCarriers {
  Map<String, _CarriersData>? carriers;

  _IndicativePricesCarriers({this.carriers});

  factory _IndicativePricesCarriers.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> carriersMap = json['carriers'];
    Map<String, _CarriersData> carriersDataMap = <String, _CarriersData>{};
    carriersMap.forEach((key, value) {
      carriersDataMap[key] = _CarriersData.fromJson(value);
    });

    return _IndicativePricesCarriers(carriers: carriersDataMap);
  }
}

class _CarriersData {
  String? name;
  String? imageUrl;
  String? iata;
  String? icao;
  String? displayCode;

  _CarriersData(
      {this.name, this.imageUrl, this.iata, this.icao, this.displayCode});

  _CarriersData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];
    iata = json['iata'];
    icao = json['icao'];
    displayCode = json['displayCode'];
  }
}

class IndicativePricesPlaces {
  Map<String, _PlacesData>? places;

  IndicativePricesPlaces({this.places});

  factory IndicativePricesPlaces.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> placesMap = json['places'];
    Map<String, _PlacesData> placesDataMap = <String, _PlacesData>{};
    placesMap.forEach((key, value) {
      placesDataMap[key] = _PlacesData.fromJson(value);
    });

    return IndicativePricesPlaces(places: placesDataMap);
  }
}

class _PlacesData {
  String? entityId;
  String? parentId;
  String? name;
  String? type;
  String? iata;
  _IndicativePricesCoordinates? coordinates;

  _PlacesData(
      {this.entityId,
      this.parentId,
      this.name,
      this.type,
      this.iata,
      this.coordinates});

  _PlacesData.fromJson(Map<String, dynamic> json) {
    entityId = json['entityId'];
    parentId = json['parentId'];
    name = json['name'];
    type = json['type'];
    iata = json['iata'];
    coordinates = json['coordinates'] != null
        ? new _IndicativePricesCoordinates.fromJson(json['coordinates'])
        : null;
  }
}

class _IndicativePricesCoordinates {
  double? latitude;
  double? longitude;

  _IndicativePricesCoordinates({this.latitude, this.longitude});

  _IndicativePricesCoordinates.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class _Quotes {
  Map<String, _QuotesData>? quotes;

  _Quotes({this.quotes});

  factory _Quotes.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> quotesMap = json['quotes'];
    Map<String, _QuotesData> quotesDataMap = <String, _QuotesData>{};
    quotesMap.forEach((key, value) {
      quotesDataMap[key] = _QuotesData.fromJson(value);
    });

    return _Quotes(quotes: quotesDataMap);
  }
}

class _QuotesData {
  _MinPrice? minPrice;
  bool? isDirect;
  _OutboundLeg? outboundLeg;
  _OutboundLeg? inboundLeg;

  _QuotesData(
      {this.minPrice, this.isDirect, this.outboundLeg, this.inboundLeg});

  _QuotesData.fromJson(Map<String, dynamic> json) {
    minPrice = json['minPrice'] != null
        ? new _MinPrice.fromJson(json['minPrice'])
        : null;
    isDirect = json['isDirect'];
    outboundLeg = json['outboundLeg'] != null
        ? new _OutboundLeg.fromJson(json['outboundLeg'])
        : null;
    inboundLeg = json['inboundLeg'] != null
        ? new _OutboundLeg.fromJson(json['inboundLeg'])
        : null;
  }
}

class _MinPrice {
  String? amount;
  String? unit;
  String? updateStatus;

  _MinPrice({this.amount, this.unit, this.updateStatus});

  _MinPrice.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    unit = json['unit'];
    updateStatus = json['updateStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['amount'] = this.amount;
    data['unit'] = this.unit;
    data['updateStatus'] = this.updateStatus;
    return data;
  }
}

class _OutboundLeg {
  String? originPlaceId;
  String? destinationPlaceId;
  _DepartureDateTime? departureDateTime;
  String? quoteCreationTimestamp;
  String? marketingCarrierId;

  _OutboundLeg(
      {this.originPlaceId,
      this.destinationPlaceId,
      this.departureDateTime,
      this.quoteCreationTimestamp,
      this.marketingCarrierId});

  _OutboundLeg.fromJson(Map<String, dynamic> json) {
    originPlaceId = json['originPlaceId'];
    destinationPlaceId = json['destinationPlaceId'];
    departureDateTime = json['departureDateTime'] != null
        ? _DepartureDateTime.fromJson(json['departureDateTime'])
        : null;
    quoteCreationTimestamp = json['quoteCreationTimestamp'];
    marketingCarrierId = json['marketingCarrierId'];
  }
}

class _DepartureDateTime {
  int? year;
  int? month;
  int? day;
  int? hour;
  int? minute;
  int? second;

  _DepartureDateTime(
      {this.year, this.month, this.day, this.hour, this.minute, this.second});

  _DepartureDateTime.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    day = json['day'];
    hour = json['hour'];
    minute = json['minute'];
    second = json['second'];
  }
}

class _GroupingOptions {
  _ByRoute? byRoute;
  _ByDate? byDate;

  _GroupingOptions({this.byRoute, this.byDate});

  _GroupingOptions.fromJson(Map<String, dynamic> json) {
    byRoute =
        json['byRoute'] != null ? _ByRoute.fromJson(json['byRoute']) : null;
    byDate = json['byDate'] != null ? _ByDate.fromJson(json['byDate']) : null;
  }
}

class _ByRoute {
  List<_QuotesGroups>? quotesGroups;

  _ByRoute({this.quotesGroups});

  _ByRoute.fromJson(Map<String, dynamic> json) {
    if (json['quotesGroups'] != null) {
      quotesGroups = <_QuotesGroups>[];
      json['quotesGroups'].forEach((v) {
        quotesGroups!.add(new _QuotesGroups.fromJson(v));
      });
    }
  }
}

class _QuotesGroups {
  String? originPlaceId;
  String? destinationPlaceId;
  List<String>? quoteIds;

  _QuotesGroups({this.originPlaceId, this.destinationPlaceId, this.quoteIds});

  _QuotesGroups.fromJson(Map<String, dynamic> json) {
    originPlaceId = json['originPlaceId'];
    destinationPlaceId = json['destinationPlaceId'];
    quoteIds = json['quoteIds'].cast<String>();
  }
}

class _ByDate {
  List<_QuotesInboundGroups>? quotesInboundGroups;
  List<_QuotesOutboundGroups>? quotesOutboundGroups;

  _ByDate({this.quotesInboundGroups, this.quotesOutboundGroups});

  _ByDate.fromJson(Map<String, dynamic> json) {
    if (json['quotesInboundGroups'] != null) {
      quotesInboundGroups = <_QuotesInboundGroups>[];
      json['quotesInboundGroups'].forEach((v) {
        quotesInboundGroups!.add(new _QuotesInboundGroups.fromJson(v));
      });
    }
    if (json['quotesOutboundGroups'] != null) {
      quotesOutboundGroups = <_QuotesOutboundGroups>[];
      json['quotesOutboundGroups'].forEach((v) {
        quotesOutboundGroups!.add(new _QuotesOutboundGroups.fromJson(v));
      });
    }
  }
}

class _QuotesInboundGroups {
  _MonthYearDate? monthYearDate;
  List<String>? quoteIds;

  _QuotesInboundGroups({this.monthYearDate, this.quoteIds});

  _QuotesInboundGroups.fromJson(Map<String, dynamic> json) {
    monthYearDate = json['monthYearDate'] != null
        ? new _MonthYearDate.fromJson(json['monthYearDate'])
        : null;
    quoteIds = json['quoteIds'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.monthYearDate != null) {
      data['monthYearDate'] = this.monthYearDate!.toJson();
    }
    data['quoteIds'] = this.quoteIds;
    return data;
  }
}

class _QuotesOutboundGroups {
  List<_QuotesOutboundGroups>? quotesOutboundGroups;

  _QuotesOutboundGroups({this.quotesOutboundGroups});

  _QuotesOutboundGroups.fromJson(Map<String, dynamic> json) {
    if (json['quotesOutboundGroups'] != null) {
      quotesOutboundGroups = <_QuotesOutboundGroups>[];
      json['quotesOutboundGroups'].forEach((v) {
        quotesOutboundGroups!.add(new _QuotesOutboundGroups.fromJson(v));
      });
    }
  }
}

class _MonthYearDate {
  int? year;
  int? month;
  int? day;

  _MonthYearDate({this.year, this.month, this.day});

  _MonthYearDate.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['month'] = this.month;
    data['day'] = this.day;
    return data;
  }
}
