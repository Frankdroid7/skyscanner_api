import 'highlight.dart';

class CarHireResponse {
  List<CarHirePlaces>? places;

  CarHireResponse({this.places});

  CarHireResponse.fromJson(Map<String, dynamic> json) {
    if (json['places'] != null) {
      places = <CarHirePlaces>[];
      json['places'].forEach((v) {
        places!.add(CarHirePlaces.fromJson(v));
      });
    }
  }
}

class CarHirePlaces {
  /// Name of the place e.g. London.
  String? name;

  /// Indicates emphasis on characters which match the searchTerm.
  Highlight? highlight;

  /// Shows hierarchy of places related to this entity. E.g. City of Edinburgh.
  String? hierarchy;

  /// Type of place. e.g. PLACE_TYPE_AIRPORT, PLACE_TYPE_CITY, PLACE_TYPE_DISTRICT etc
  String? type;

  /// A unique ID for the place. It's an internal ID and it doesn't have any meaning outside of our APIs.
  String? entityId;

  /// Coordinates of the entity. Expressed as a comma seperated latitude/longitude pair e.g. 55.9497, -3.3635.
  String? location;

  CarHirePlaces(
      {this.hierarchy,
      this.location,
      this.name,
      this.highlight,
      this.entityId,
      this.type});

  CarHirePlaces.fromJson(Map<String, dynamic> json) {
    hierarchy = json['hierarchy'];
    location = json['location'];
    name = json['name'];
    highlight = json['highlight'] != null
        ? Highlight.fromJson(json['highlight'])
        : null;
    entityId = json['entityId'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hierarchy'] = this.hierarchy;
    data['location'] = this.location;
    data['name'] = this.name;
    if (this.highlight != null) {
      data['highlight'] = this.highlight!.toJson();
    }
    data['entityId'] = this.entityId;
    data['type'] = this.type;
    return data;
  }
}
