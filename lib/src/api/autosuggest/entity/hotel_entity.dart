class HotelEntity {
  /// Object containing parameters for flights autosuggest search.
  HotelQuery? query;

  /// Limits number of entities returned in response. Take a min value of 1 and max of 50.
  int? limit;

  HotelEntity({this.query, this.limit});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['query'] = query?.toJson();
    data['limit'] = limit;
    return data;
  }
}

class HotelQuery {
  /// Market where search is coming from. E.g. UK.
  String market;

  /// Language to be used for the search. E.g. en-GB.
  String locale;

  /// The string to get autosuggest results for. If left blank, the most popular flights will be returned.
  String searchTerm;

  /// Can be used to filter type of places returned. These are the possible entity types:
  ///
  /// "PLACE_TYPE_SEA"
  /// "PLACE_TYPE_CITY"
  /// "PLACE_TYPE_HOTEL"
  /// "PLACE_TYPE_ISLAND"
  /// "PLACE_TYPE_AIRPORT"
  /// "PLACE_TYPE_COUNTRY"
  /// "PLACE_TYPE_DISTRICT"
  /// "PLACE_TYPE_SEA_COAST"
  /// "PLACE_TYPE_MOUNTAIN_RANGE"
  /// "PLACE_TYPE_FIRST_LEVEL_NATION_ADMINISTRATIVE_DIVISION"
  /// "PLACE_TYPE_SECOND_LEVEL_NATION_ADMINISTRATIVE_DIVISION"
  List<String>? includedEntityTypes;

  HotelQuery({
    required this.market,
    required this.locale,
    required this.searchTerm,
    this.includedEntityTypes,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['market'] = market;
    data['locale'] = locale;
    data['searchTerm'] = searchTerm;
    data['includedEntityTypes'] = includedEntityTypes ?? [];
    return data;
  }
}
