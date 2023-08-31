import 'package:skyscanner_api/src/api/flight/indicative/entity/indicative_search_entity/date_time_grouping_type_enum.dart';

import 'mquery_leg.dart';

class IndicativeSearchQuery {
  String currency;
  String locale;
  String market;
  DateTimeGroupingType dateTimeGroupingType;
  List<IndicativeSearchQueryLeg> queryLegs;

  IndicativeSearchQuery(
      {required this.currency,
      required this.locale,
      required this.market,
      this.dateTimeGroupingType =
          DateTimeGroupingType.DATE_TIME_GROUPING_TYPE_UNSPECIFIED,
      required this.queryLegs})
      : assert(queryLegs.isNotEmpty && queryLegs.length <= 2,
            'queryLegs must not be empty and must not be more than 2');

  factory IndicativeSearchQuery.fromJson(Map<String, dynamic> json) =>
      IndicativeSearchQuery(
        currency: json['currency'] as String,
        locale: json['locale'] as String,
        market: json['market'] as String,
        dateTimeGroupingType:
            DateTimeGroupingType.fromString(json['dateTimeGroupingType']),
        queryLegs: (json['queryLegs'] as List<dynamic>)
            .map((e) =>
                IndicativeSearchQueryLeg.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'currency': currency,
        'locale': locale,
        'market': market,
        'dateTimeGroupingType': dateTimeGroupingType.name,
        'queryLegs': queryLegs.map((e) => e.toJson()).toList(),
      };
}
