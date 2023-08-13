class DestinationPlaceId {
  String? iataOrEntityId;

  DestinationPlaceId({this.iataOrEntityId});

  factory DestinationPlaceId.fromJson(Map<String, dynamic> json) {
    return DestinationPlaceId(
      iataOrEntityId: json['iata'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'iata': iataOrEntityId,
      };
}
