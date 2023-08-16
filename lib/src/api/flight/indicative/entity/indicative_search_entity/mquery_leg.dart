import 'date_range.dart';
import 'destination_place.dart';
import 'origin_place.dart';

class IndicativeSearchQueryLeg {
  OriginPlace originPlace;
  DestinationPlace destinationPlace;
  DateRange? dateRange;

  IndicativeSearchQueryLeg(
      {required this.originPlace,
      required this.destinationPlace,
      this.dateRange});

  factory IndicativeSearchQueryLeg.fromJson(Map<String, dynamic> json) =>
      IndicativeSearchQueryLeg(
        originPlace:
            OriginPlace.fromJson(json['originPlace'] as Map<String, dynamic>),
        destinationPlace: DestinationPlace.fromJson(
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
