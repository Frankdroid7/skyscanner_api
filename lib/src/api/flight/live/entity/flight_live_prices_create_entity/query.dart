import 'package:skyscanner_api/skyscanner_export.dart';

class Query {
  String? market;
  String? locale;
  String? currency;
  List<QueryLeg> queryLegs;
  int adults;
  List<dynamic>? childrenAges;
  CabinClass cabinClass;
  List<dynamic>? excludedAgentsIds;
  List<dynamic>? excludedCarriersIds;
  List<dynamic>? includedAgentsIds;
  List<dynamic>? includedCarriersIds;

  Query({
    required this.market,
    required this.locale,
    required this.currency,
    required this.queryLegs,
    required this.adults,
    this.childrenAges,
    required this.cabinClass,
    this.excludedAgentsIds,
    this.excludedCarriersIds,
    this.includedAgentsIds,
    this.includedCarriersIds,
  }) : assert(queryLegs.isNotEmpty);

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        market: json['market'] as String?,
        locale: json['locale'] as String?,
        currency: json['currency'] as String?,
        queryLegs: (json['queryLegs'] as List<dynamic>)
            .map((e) => QueryLeg.fromJson(e as Map<String, dynamic>))
            .toList(),
        adults: json['adults'] as int,
        childrenAges: json['childrenAges'] as List<dynamic>?,
        cabinClass: CabinClass.fromString(json['cabinClass']),
        excludedAgentsIds: json['excludedAgentsIds'] as List<dynamic>?,
        excludedCarriersIds: json['excludedCarriersIds'] as List<dynamic>?,
        includedAgentsIds: json['includedAgentsIds'] as List<dynamic>?,
        includedCarriersIds: json['includedCarriersIds'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'market': market,
        'locale': locale,
        'currency': currency,
        'queryLegs': queryLegs.map((e) => e.toJson()).toList(),
        'adults': adults,
        'childrenAges': childrenAges,
        'cabinClass': cabinClass.name,
        'excludedAgentsIds': excludedAgentsIds,
        'excludedCarriersIds': excludedCarriersIds,
        'includedAgentsIds': includedAgentsIds,
        'includedCarriersIds': includedCarriersIds,
      };
}
