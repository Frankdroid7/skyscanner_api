class DestinationPlaceId {
  String? entityId;
  String? iata;

  DestinationPlaceId({this.entityId, this.iata})
      : assert(entityId != null || iata != null,
            'Either entityId or iata must be provided');

  factory DestinationPlaceId.fromJson(Map<String, dynamic> json) {
    return DestinationPlaceId(
      entityId: json['entityId'],
      iata: json['iata'],
    );
  }

  Map<String, dynamic> toJson() => {
        'iata': iata,
        'entityId': entityId,
      };
}
