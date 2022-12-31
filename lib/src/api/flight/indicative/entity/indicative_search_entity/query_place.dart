class QueryPlace {
  String? entityId;

  QueryPlace({this.entityId});

  factory QueryPlace.fromJson(Map<String, dynamic> json) => QueryPlace(
        entityId: json['entityId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'entityId': entityId,
      };
}
