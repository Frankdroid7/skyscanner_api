import 'query_leg.dart';

class Query {
  String? market;
  String? locale;
  String? currency;
  List<QueryLeg>? queryLegs;
  int? adults;
  List<dynamic>? childrenAges;
  String? cabinClass;
  List<dynamic>? excludedAgentsIds;
  List<dynamic>? excludedCarriersIds;
  List<dynamic>? includedAgentsIds;
  List<dynamic>? includedCarriersIds;

  Query({
    this.market,
    this.locale,
    this.currency,
    this.queryLegs,
    this.adults,
    this.childrenAges,
    this.cabinClass,
    this.excludedAgentsIds,
    this.excludedCarriersIds,
    this.includedAgentsIds,
    this.includedCarriersIds,
  });

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        market: json['market'] as String?,
        locale: json['locale'] as String?,
        currency: json['currency'] as String?,
        queryLegs: (json['queryLegs'] as List<dynamic>?)
            ?.map((e) => QueryLeg.fromJson(e as Map<String, dynamic>))
            .toList(),
        adults: json['adults'] as int?,
        childrenAges: json['childrenAges'] as List<dynamic>?,
        cabinClass: json['cabinClass'] as String?,
        excludedAgentsIds: json['excludedAgentsIds'] as List<dynamic>?,
        excludedCarriersIds: json['excludedCarriersIds'] as List<dynamic>?,
        includedAgentsIds: json['includedAgentsIds'] as List<dynamic>?,
        includedCarriersIds: json['includedCarriersIds'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'market': market,
        'locale': locale,
        'currency': currency,
        'queryLegs': queryLegs?.map((e) => e.toJson()).toList(),
        'adults': adults,
        'childrenAges': childrenAges,
        'cabinClass': cabinClass,
        'excludedAgentsIds': excludedAgentsIds,
        'excludedCarriersIds': excludedCarriersIds,
        'includedAgentsIds': includedAgentsIds,
        'includedCarriersIds': includedCarriersIds,
      };
}
