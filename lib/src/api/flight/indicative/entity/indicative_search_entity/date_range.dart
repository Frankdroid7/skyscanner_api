import 'end_date.dart';
import 'start_date.dart';

class DateRange {
  StartDate? startDate;
  EndDate? endDate;

  DateRange({this.startDate, this.endDate});

  factory DateRange.fromJson(Map<String, dynamic> json) => DateRange(
        startDate: json['startDate'] == null
            ? null
            : StartDate.fromJson(json['startDate'] as Map<String, dynamic>),
        endDate: json['endDate'] == null
            ? null
            : EndDate.fromJson(json['endDate'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'startDate': startDate?.toJson(),
        'endDate': endDate?.toJson(),
      };
}
