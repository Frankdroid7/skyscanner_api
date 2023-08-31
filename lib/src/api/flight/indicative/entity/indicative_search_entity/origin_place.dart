import 'query_place.dart';

class OriginPlace {
  QueryPlace queryPlace;

  OriginPlace({required this.queryPlace});

  factory OriginPlace.fromJson(Map<String, dynamic> json) => OriginPlace(
        queryPlace:
            QueryPlace.fromJson(json['queryPlace'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'queryPlace': queryPlace.toJson(),
      };
}
