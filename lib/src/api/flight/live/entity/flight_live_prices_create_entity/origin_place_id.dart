class OriginPlaceId {
  String? iata;

  OriginPlaceId({this.iata});

  factory OriginPlaceId.fromJson(Map<String, dynamic> json) => OriginPlaceId(
        iata: json['iata'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'iata': iata,
      };
}
