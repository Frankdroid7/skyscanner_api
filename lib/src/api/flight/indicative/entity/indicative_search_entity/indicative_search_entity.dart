import 'mquery.dart';

/// An entity class for sending a request body
/// use the [alternativeParam] parameter to send a request body fields
/// that is not included in the original entity model
class IndicativeSearchEntity {
  IndicativeSearchQuery query;
  Map<String, dynamic>? alternativeParam;

  IndicativeSearchEntity({required this.query, this.alternativeParam});

  factory IndicativeSearchEntity.fromJson(Map<String, dynamic> json) {
    return IndicativeSearchEntity(
      query:
          IndicativeSearchQuery.fromJson(json['query'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'query': query.toJson(),
        if (alternativeParam != null) ...alternativeParam ?? {}
      };
}
