import 'package:skyscanner_api/src/common/common_export.dart';

class GeoFlightResponse {
  final logger = getLogger('GeoFlightResponse');

  final String? status;
  final List<Places>? places;

  GeoFlightResponse({this.status, this.places});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (status != null) result.addAll({'status': status});
    if (places != null) result.addAll({'places': places});

    return result;
  }

  factory GeoFlightResponse.fromMap(Map<String, dynamic> map) {
    List<Places> places = [];
    map['places']
        ?.forEach((key, _) => places.add(Places.fromMap(map['places']?[key])));
    return GeoFlightResponse(status: map['status'], places: places);
  }
}

class Places {
  final String? entityId;
  final String? parentId;
  final String? name;
  final String? type;
  final String? iata;
  final Coordinates? coordinates;

  Places(
      {this.entityId,
      this.parentId,
      this.name,
      this.type,
      this.iata,
      this.coordinates});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (entityId != null) {
      result.addAll({'entityId': entityId});
    }
    if (parentId != null) {
      result.addAll({'parentId': parentId});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (type != null) {
      result.addAll({'type': type});
    }
    if (iata != null) {
      result.addAll({'iata': iata});
    }
    if (coordinates != null) {
      result.addAll({'coordinates': coordinates!.toMap()});
    }

    return result;
  }

  factory Places.fromMap(Map<String, dynamic> map) {
    return Places(
      entityId: map['entityId'],
      parentId: map['parentId'],
      name: map['name'],
      type: map['type'],
      iata: map['iata'],
      coordinates: map['coordinates'] != null
          ? Coordinates.fromMap(map['coordinates'])
          : null,
    );
  }
}

class Coordinates {
  final double? latitude;
  final double? longitude;

  Coordinates({this.latitude, this.longitude});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (latitude != null) {
      result.addAll({'latitude': latitude});
    }
    if (longitude != null) {
      result.addAll({'longitude': longitude});
    }

    return result;
  }

  factory Coordinates.fromMap(Map<String, dynamic> map) {
    return Coordinates(
      latitude: map['latitude']?.toDouble(),
      longitude: map['longitude']?.toDouble(),
    );
  }
}
