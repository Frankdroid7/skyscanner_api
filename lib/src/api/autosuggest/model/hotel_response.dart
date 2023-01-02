import 'highlight.dart';

class HotelResponse {
  List<HotelResponsePlaces>? places;

  HotelResponse({this.places});

  HotelResponse.fromJson(Map<String, dynamic> json) {
    if (json['places'] != null) {
      places = <HotelResponsePlaces>[];
      json['places'].forEach((v) {
        places!.add(HotelResponsePlaces.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (places != null) {
      data['places'] = places!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HotelResponsePlaces {
  /// Name of the place e.g. London
  String? name;

  /// Relevance score of entry based on character input.
  double? score;

  /// Indicates emphasis on characters which match the searchTerm
  Highlight? highlight;

  /// Shows hierarchy of places related to this entity. E.g. City of Edinburgh.
  String? hierarchy;

  /// Coordinates of the entity. Expressed as a latitude/longitude pair. E.g. 55.9497, -3.3635
  String? location;

  /// A unique ID for the place. It's an internal ID and it doesn't have any meaning outside of our APIs.
  String? entityId;

  /// Type of place. See section below for possible values for PLACE_TYPE. E.g. PLACE_TYPE_AIRPORT, PLACE_TYPE_CITY, PLACE_TYPE_DISTRICT etc
  String? type;

  HotelResponsePlaces(
      {this.hierarchy,
      this.location,
      this.score,
      this.name,
      this.highlight,
      this.entityId,
      this.type});

  HotelResponsePlaces.fromJson(Map<String, dynamic> json) {
    hierarchy = json['hierarchy'];
    location = json['location'];
    score = json['score'];
    name = json['name'];
    highlight = json['highlight'] != null
        ? new Highlight.fromJson(json['highlight'])
        : null;
    entityId = json['entityId'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hierarchy'] = this.hierarchy;
    data['location'] = this.location;
    data['score'] = this.score;
    data['name'] = this.name;
    if (this.highlight != null) {
      data['highlight'] = this.highlight!.toJson();
    }
    data['entityId'] = this.entityId;
    data['type'] = this.type;
    return data;
  }
}
