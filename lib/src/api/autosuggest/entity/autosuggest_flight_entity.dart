class AutosuggestFlightEntity {
  /// Object containing parameters for flights autosuggest search.
  AutosuggestFlightQuery query;

  /// Alters ranking logic of entities. Defaults to false if not sent.
  bool? isDestination;

  /// Limits number of entities returned in response. Take a min value of 1 and max of 50.
  int? limit;

  AutosuggestFlightEntity(
      {required this.query, this.isDestination, this.limit});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['query'] = query.toJson();
    data['isDestination'] = isDestination ?? false;
    data['limit'] = limit;
    return data;
  }
}

class AutosuggestFlightQuery {
  /// Market where search is coming from. E.g. UK.
  String market;

  /// Language to be used for the search. E.g. en-GB.
  String locale;

  /// The string to get autosuggest results for. If left blank, the most popular flights will be returned.
  String searchTerm;

  /// Can be used to filter type of places returned. These are the possible entity types:
  /// "PLACE_TYPE_COUNTRY"
  /// "PLACE_TYPE_AIRPORT"
  /// "PLACE_TYPE_CITY"
  ///
  /// If you pass ["PLACE_TYPE_CITY","PLACE_TYPE_AIRPORT"] as the list, the 'entityId' that will be returned can only be used to get Flight Live Prices.
  /// If you add "PLACE_TYPE_COUNTRY" to the list OR you leave the list empty, the 'entityId' that will be returned can only be used to get Flight Indicative Prices.
  List<String>? includedEntityTypes;

  AutosuggestFlightQuery(
      {required this.market,
      required this.locale,
      required this.searchTerm,
      this.includedEntityTypes});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['market'] = market;
    data['locale'] = locale;
    data['searchTerm'] = searchTerm;
    data['includedEntityTypes'] = includedEntityTypes ?? [];
    return data;
  }
}
