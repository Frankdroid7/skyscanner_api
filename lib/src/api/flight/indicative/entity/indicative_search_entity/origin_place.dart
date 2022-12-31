import 'query_place.dart';

class OriginPlace {
  QueryPlace? queryPlace;

  OriginPlace({this.queryPlace});

  factory OriginPlace.fromJson(Map<String, dynamic> json) => OriginPlace(
        queryPlace: json['queryPlace'] == null
            ? null
            : QueryPlace.fromJson(json['queryPlace'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'queryPlace': queryPlace?.toJson(),
      };
}
