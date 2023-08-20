import 'package:skyscanner_api/skyscanner_export.dart';

class IndicativeSearchQueryLeg {
  OriginPlace originPlace;
  DestinationPlace destinationPlace;
  DateRange? dateRange;
  GenericDate? fixedDate;
  bool? anytime;

  IndicativeSearchQueryLeg(
      {required this.originPlace,
      required this.destinationPlace,
      this.fixedDate,
      this.anytime,
      this.dateRange})
      : assert(
            (dateRange != null && fixedDate == null && anytime != null) ||
                (dateRange == null &&
                    fixedDate != null &&
                    anytime == null &&
                    fixedDate.day != null) ||
                (dateRange == null && fixedDate == null && anytime != null),
            'You can should only specify one of dateRange, fixedDate or anytime. Also, when specifying fixedDate, day must be specified');

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
        'originPlace': originPlace.toJson(),
        'destinationPlace': destinationPlace.toJson(),
        'date_range': dateRange?.toJson(),
        'fixed_date': fixedDate?.toJson(),
        'anytime': anytime,
      };
}
