import 'mquery_leg.dart';

class MQuery {
  String? currency;
  String? locale;
  String? market;
  String? dateTimeGroupingType;
  List<MQueryLeg>? queryLegs;

  MQuery(
      {this.currency,
      this.locale,
      this.market,
      this.dateTimeGroupingType,
      this.queryLegs});

  factory MQuery.fromJson(Map<String, dynamic> json) => MQuery(
        currency: json['currency'] as String?,
        locale: json['locale'] as String?,
        market: json['market'] as String?,
        dateTimeGroupingType: json['dateTimeGroupingType'] as String?,
        queryLegs: (json['queryLegs'] as List<dynamic>?)
            ?.map((e) => MQueryLeg.fromJson(e as Map<String, dynamic>))
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
