class DestinationPlaceId {
  String? iata;

  DestinationPlaceId({this.iata});

  factory DestinationPlaceId.fromJson(Map<String, dynamic> json) {
    return DestinationPlaceId(
      iata: json['iata'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'iata': iata,
      };
}
