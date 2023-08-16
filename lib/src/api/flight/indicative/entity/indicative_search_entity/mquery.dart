import 'mquery_leg.dart';

class IndicativeSearchQuery {
  String? currency;
  String? locale;
  String? market;
  String? dateTimeGroupingType;
  List<IndicativeSearchQueryLeg> queryLegs;

  IndicativeSearchQuery(
      {this.currency,
      this.locale,
      this.market,
      this.dateTimeGroupingType,
      required this.queryLegs})
      : assert(queryLegs.isNotEmpty);

  factory IndicativeSearchQuery.fromJson(Map<String, dynamic> json) =>
      IndicativeSearchQuery(
        currency: json['currency'] as String?,
        locale: json['locale'] as String?,
        market: json['market'] as String?,
        dateTimeGroupingType: json['dateTimeGroupingType'] as String?,
        queryLegs: (json['queryLegs'] as List<dynamic>)
            .map((e) =>
                IndicativeSearchQueryLeg.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'currency': currency,
        'locale': locale,
        'market': market,
        'dateTimeGroupingType': dateTimeGroupingType,
        'queryLegs': queryLegs?.map((e) => e.toJson()).toList(),
      };
}
