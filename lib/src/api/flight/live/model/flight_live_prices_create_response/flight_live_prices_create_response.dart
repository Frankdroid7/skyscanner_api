import 'content.dart';

class FlightLivePricesCreateResponse {
  /// This is the token that would be passed to the poll session API to get more results.
  String? sessionToken;

  /// Indicates status of the search request is running or completed
  String? status;

  /// Indicates how to treat the SearchResults contained in a SearchContent.
  /// Prior results should only be replaced if the action is explicitly RESULT_ACTION_REPLACED.
  String? action;

  ///Additional information about the search results.
  Content? content;

  /// You would only get this token when you call the itinerary refresh method.
  String? refreshSessionToken;

  FlightLivePricesCreateResponse(
      {this.sessionToken,
      this.status,
      this.action,
      this.content,
      this.refreshSessionToken});

  factory FlightLivePricesCreateResponse.fromJson(Map<String, dynamic> json) {
    return FlightLivePricesCreateResponse(
      sessionToken: json['sessionToken'] as String?,
      refreshSessionToken: json['refreshSessionToken'] as String?,
      status: json['status'] as String?,
      action: json['action'] as String?,
      content: json['content'] == null
          ? null
          : Content.fromJson(json['content'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'sessionToken': sessionToken,
        'status': status,
        'action': action,
        'content': content?.toJson(),
        'refreshToken': refreshSessionToken,
      };
}
