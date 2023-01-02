class ApiPath {
  /// Carriers APIs
  static const String carriers = 'flights/carriers';

  /// Referrals APIs
  static const String carsDayView = 'cars/day-view/';
  static const String flightsDayView = 'flights/day-view/';

  /// Culture APIs
  static const String cultureMarkets = 'culture/markets';
  static const String cultureLocales = 'culture/locales';
  static const String cultureCurrencies = 'culture/currencies';
  static const String nearestCulture = 'culture/nearestculture';

  /// Autosuggest APIs
  static const String autosuggestHotels = 'autosuggest/hotels';
  static const String autosuggestCarHire = 'autosuggest/carhire';
  static const String autosuggestFlights = 'autosuggest/flights';

  ///Flight Indicative APIs
  static const String indicativeSearch = 'flights/indicative/search';

  ///Geo APIs
  static const String geoFlights = 'geo/hierarchy/flights/';
  static const String geoNearestFlights = 'geo/hierarchy/flights/nearest';

  ///Flight Live APIs
  static const String createItineraryRefresh =
      'flights/live/itineraryrefresh/create/';
  static const String createFlightsLiveSearchCreate =
      'flights/live/search/create';
  static const String createItineraryRefreshSessionToken =
      'flights/live/itineraryrefresh/poll/';
  static const String createFlightsLiveSearchPoll = 'flights/live/search/poll/';
}
