import '../../../../../common/models/sky_scanner_date.dart';
import 'destination_place_id.dart';
import 'origin_place_id.dart';

class QueryLeg {
  OriginPlaceId originPlaceId;
  DestinationPlaceId destinationPlaceId;
  SkyScannerDate date;

  QueryLeg(
      {required this.originPlaceId,
      required this.destinationPlaceId,
      required this.date});

  factory QueryLeg.fromJson(Map<String, dynamic> json) => QueryLeg(
        originPlaceId: OriginPlaceId.fromJson(
            json['originPlaceId'] as Map<String, dynamic>),
        destinationPlaceId: DestinationPlaceId.fromJson(
            json['destinationPlaceId'] as Map<String, dynamic>),
        date: SkyScannerDate.fromJson(json['date'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'originPlaceId': originPlaceId.toJson(),
        'destinationPlaceId': destinationPlaceId.toJson(),
        'date': date.toJson(),
      };
}
