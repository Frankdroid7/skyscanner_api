import 'date.dart';
import 'destination_place_id.dart';
import 'origin_place_id.dart';

class QueryLeg {
  OriginPlaceId? originPlaceId;
  DestinationPlaceId? destinationPlaceId;
  Date? date;

  QueryLeg({this.originPlaceId, this.destinationPlaceId, this.date});

  factory QueryLeg.fromJson(Map<String, dynamic> json) => QueryLeg(
        originPlaceId: json['originPlaceId'] == null
            ? null
            : OriginPlaceId.fromJson(
                json['originPlaceId'] as Map<String, dynamic>),
        destinationPlaceId: json['destinationPlaceId'] == null
            ? null
            : DestinationPlaceId.fromJson(
                json['destinationPlaceId'] as Map<String, dynamic>),
        date: json['date'] == null
            ? null
            : Date.fromJson(json['date'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'originPlaceId': originPlaceId?.toJson(),
        'destinationPlaceId': destinationPlaceId?.toJson(),
        'date': date?.toJson(),
      };
}
