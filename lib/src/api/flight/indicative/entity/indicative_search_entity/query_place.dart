class QueryPlace {
  String? entityId;
  String? iata;

  QueryPlace({this.entityId, this.iata})
      : assert(entityId != null || iata != null,
            'Either entityId or iata must be provided');

  factory QueryPlace.fromJson(Map<String, dynamic> json) => QueryPlace(
        entityId: json['entityId'] as String?,
        iata: json['iata'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'entityId': entityId,
        'iata': iata,
      };
}
