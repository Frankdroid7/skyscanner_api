import 'query.dart';

/// An entity class for sending a request body
/// use the [alternativeParam] parameter to send a request body fields
/// that is not included in the original entity model
class FlightLivePricesCreateEntity {
  Query? query;
  Map<String, dynamic>? alternativeParam;

  FlightLivePricesCreateEntity({this.query, this.alternativeParam});

  factory FlightLivePricesCreateEntity.fromJson(Map<String, dynamic> json) {
    return FlightLivePricesCreateEntity(
        query: json['query'] == null
            ? null
            : Query.fromJson(json['query'] as Map<String, dynamic>));
  }

  Map<String, dynamic> toJson() => {
        if (query != null) 'query': query?.toJson(),
        if (alternativeParam != null) ...alternativeParam ?? {}
      };
}
