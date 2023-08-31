class AutosuggestFlightResponse {
  List<AutosuggestFlightPlaces>? places;

  AutosuggestFlightResponse({this.places});

  AutosuggestFlightResponse.fromJson(Map<String, dynamic> json) {
    if (json['places'] != null) {
      places = <AutosuggestFlightPlaces>[];
      json['places'].forEach((v) {
        places!.add(AutosuggestFlightPlaces.fromJson(v));
      });
    }
  }
}

class AutosuggestFlightPlaces {
  /// Parent entity Id for this entity.
  String? parentId;

  /// The IATA code of the entity. E.g. LHR
  String? iataCode;

  /// Name of the entity. E.g London Heathrow
  String? name;

  /// Name of the city the entity is located in. E.g. London
  String? cityName;

  /// Name of country entity is located in. E.g. United Kingdom
  String? countryName;

  /// Type of place. See section below for possible values for PLACE_TYPE.
  List<dynamic>? highlighting;

  /// Two dimensional list displaying keywords in entity to be highlighted. E.g. [[7,15]]
  String? type;

  /// Country code for where the entity is located. E.g. London will have a countryId of GB.
  String? countryId;

  /// Coordinates of the entity. Expressed as a latitude/longitude pair. E.g. 51.471389,-0.452778
  String? location;

  /// A unique ID for the place. It's an internal ID and it doesn't have any meaning outside of our APIs.
  String? entityId;

  /// Shows hierarchy of places related to this entity. E.g. London Heathrow (LHR), London|England|United Kingdom
  String? hierarchy;

  /// Object containing information about nearest airport to entity. See section below for more detailed information
  AirportInformation? airportInformation;

  AutosuggestFlightPlaces(
      {this.entityId,
      this.iataCode,
      this.parentId,
      this.name,
      this.countryId,
      this.countryName,
      this.cityName,
      this.location,
      this.hierarchy,
      this.type,
      this.highlighting,
      this.airportInformation});

  AutosuggestFlightPlaces.fromJson(Map<String, dynamic> json) {
    entityId = json['entityId'];
    iataCode = json['iataCode'];
    parentId = json['parentId'];
    name = json['name'];
    countryId = json['countryId'];
    countryName = json['countryName'];
    cityName = json['cityName'];
    location = json['location'];
    hierarchy = json['hierarchy'];
    type = json['type'];
    highlighting = json['highlighting'] ?? [] as List<List<int>>?;

    airportInformation = json['airportInformation'] != null
        ? AirportInformation.fromJson(json['airportInformation'])
        : null;
  }
}

class AirportInformation {
  String? iataCode;
  String? name;
  String? countryId;
  String? cityId;
  String? entityId;
  String? parentId;
  Distance? distance;
  String? location;

  AirportInformation(
      {this.iataCode,
      this.name,
      this.countryId,
      this.cityId,
      this.entityId,
      this.parentId,
      this.distance,
      this.location});

  AirportInformation.fromJson(Map<String, dynamic> json) {
    iataCode = json['iataCode'];
    name = json['name'];
    countryId = json['countryId'];
    cityId = json['cityId'];
    entityId = json['entityId'];
    parentId = json['parentId'];
    distance =
        json['distance'] != null ? Distance.fromJson(json['distance']) : null;
    location = json['location'];
  }
}

class Distance {
  int? value;
  String? unitCode;

  Distance({this.value, this.unitCode});

  Distance.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    unitCode = json['unitCode'];
  }
}
