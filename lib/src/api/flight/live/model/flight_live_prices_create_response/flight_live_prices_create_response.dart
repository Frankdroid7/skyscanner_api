import 'content.dart';

class FlightLivePricesCreateResponse {
  String? sessionToken;
  String? status;
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
