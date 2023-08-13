class OriginPlaceId {
  String iataOrEntityId;

  OriginPlaceId({required this.iataOrEntityId});

  factory OriginPlaceId.fromJson(Map<String, dynamic> json) => OriginPlaceId(
        iataOrEntityId: json['iata'],
      );

  Map<String, dynamic> toJson() => {
        'iata': iataOrEntityId,
      };
}
