class OriginPlaceId {
  String? entityId;
  String? iata;

  OriginPlaceId({this.entityId, this.iata})
      : assert(entityId != null || iata != null,
            'Either entityId or iata must be provided');

  factory OriginPlaceId.fromJson(Map<String, dynamic> json) => OriginPlaceId(
        entityId: json['entityId'],
        iata: json['iata'],
      );

  Map<String, dynamic> toJson() => {
        'entityId': entityId,
        'iata': iata,
      };
}
