import 'content.dart';

class FlightLivePricesCreateResponse {
  String? sessionToken;

  /// Indicates status of the search request is running or completed
  String? status;

  /// Indicates how to treat the SearchResults contained in a SearchContent.
  /// Prior results should only be replaced if the action is explicitly RESULT_ACTION_REPLACED.
  String? action;

  Content? content;

  FlightLivePricesCreateResponse(
      {this.sessionToken, this.status, this.action, this.content});

  factory FlightLivePricesCreateResponse.fromJson(Map<String, dynamic> json) {
    return FlightLivePricesCreateResponse(
      sessionToken: json['sessionToken'] as String?,
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
      };
}
