import 'query_place.dart';

class DestinationPlace {
  QueryPlace? queryPlace;

  DestinationPlace({this.queryPlace});

  factory DestinationPlace.fromJson(Map<String, dynamic> json) {
    return DestinationPlace(
      queryPlace: json['queryPlace'] == null
          ? null
          : QueryPlace.fromJson(json['queryPlace'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'queryPlace': queryPlace?.toJson(),
      };
}
