import 'package:skyscanner_api/src/common/models/sky_scanner_coordinates.dart';

class GeoFlightResponse {
  final String? status;
  final List<GeoFlightPlaces>? places;

  GeoFlightResponse({this.status, this.places});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (status != null) result.addAll({'status': status});
    if (places != null) result.addAll({'places': places});

    return result;
  }

  factory GeoFlightResponse.fromMap(Map<String, dynamic> map) {
    List<GeoFlightPlaces> places = [];
    map['places']?.forEach(
        (key, _) => places.add(GeoFlightPlaces.fromMap(map['places']?[key])));
    return GeoFlightResponse(status: map['status'], places: places);
  }
}

class GeoFlightPlaces {
  final String? entityId;
  final String? parentId;
  final String? name;
  final String? type;
  final String? iata;
  final Coordinates? coordinates;

  GeoFlightPlaces(
      {this.entityId,
      this.parentId,
      this.name,
      this.type,
      this.iata,
      this.coordinates});

  factory GeoFlightPlaces.fromMap(Map<String, dynamic> map) {
    return GeoFlightPlaces(
      entityId: map['entityId'],
      parentId: map['parentId'],
      name: map['name'],
      type: map['type'],
      iata: map['iata'],
      coordinates: map['coordinates'] != null
          ? Coordinates.fromJson(map['coordinates'])
          : null,
    );
  }
}
