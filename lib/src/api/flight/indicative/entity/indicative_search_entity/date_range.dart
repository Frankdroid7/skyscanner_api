import 'end_date.dart';
import 'start_date.dart';

class DateRange {
  GenericDate startDate;
  GenericDate endDate;

  DateRange({required this.startDate, required this.endDate});

  factory DateRange.fromJson(Map<String, dynamic> json) => DateRange(
        startDate:
            GenericDate.fromJson(json['startDate'] as Map<String, dynamic>),
        endDate: GenericDate.fromJson(json['endDate'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'startDate': startDate.toJson(),
        'endDate': endDate.toJson(),
      };
}
