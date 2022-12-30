class NearestFlight {
  String locale;

  Locator locator;

  NearestFlight({required this.locale, required this.locator});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['locale'] = locale;
    data['locator'] = locator.toJson();
    return data;
  }
}

/// When using the [Locator] class, pass in either [coordinates] or [ipAddress] but not both.

class Locator {
  Coordinates? coordinates;
  String? ipAddress;

  Locator({this.coordinates, this.ipAddress});

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
