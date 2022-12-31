import 'date_range.dart';
import 'destination_place.dart';
import 'origin_place.dart';

class MQueryLeg {
  OriginPlace? originPlace;
  DestinationPlace? destinationPlace;
  DateRange? dateRange;

  MQueryLeg({this.originPlace, this.destinationPlace, this.dateRange});

  factory MQueryLeg.fromJson(Map<String, dynamic> json) => MQueryLeg(
        originPlace: json['originPlace'] == null
            ? null
            : OriginPlace.fromJson(json['originPlace'] as Map<String, dynamic>),
        destinationPlace: json['destinationPlace'] == null
            ? null
            : DestinationPlace.fromJson(
                json['destinationPlace'] as Map<String, dynamic>),
        dateRange: json['date_range'] == null
            ? null
            : DateRange.fromJson(json['date_range'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'originPlace': originPlace?.toJson(),
        'destinationPlace': destinationPlace?.toJson(),
        'date_range': dateRange?.toJson(),
      };
}
