class NearestFlightEntity {
  String locale;

  LocatorEntity locator;

  NearestFlightEntity({required this.locale, required this.locator});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['locale'] = locale;
    data['locator'] = locator.toJson();
    return data;
  }
}

/// When using the [LocatorEntity] class, pass in either [coordinates] or [ipAddress] but not both.

class LocatorEntity {
  Coordinates? coordinates;
  String? ipAddress;

  LocatorEntity({this.coordinates, this.ipAddress});

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

class Coordinates {
  double latitude;
  double longitude;

  Coordinates({required this.latitude, required this.longitude});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
