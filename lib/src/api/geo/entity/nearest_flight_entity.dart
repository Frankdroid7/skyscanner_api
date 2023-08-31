import '../../../common/models/sky_scanner_coordinates.dart';

class NearestFlightEntity {
  String? locale;
  LocatorEntity? locator;

  NearestFlightEntity({this.locale, this.locator});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['locale'] = locale;
    data['locator'] = locator?.toJson();
    return data;
  }
}

/// When using the [LocatorEntity] class, pass in either [coordinates] or [ipAddress] but not both.

class LocatorEntity {
  Coordinates? coordinates;
  String? ipAddress;

  LocatorEntity({this.coordinates, this.ipAddress})
      : assert(
            (coordinates != null && ipAddress == null) ||
                (coordinates == null && ipAddress != null),
            'When using the LocatorEntity class, pass in either coordinates or ipAddress but not both.');

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coordinates != null) {
      data['coordinates'] = coordinates!.toJson();
    }
    if (ipAddress != null) {
      data['ipAddress'] = ipAddress;
    }
    return data;
  }
}
