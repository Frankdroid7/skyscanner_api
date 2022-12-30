import 'package:collection/collection.dart';

import 'content.dart';

class SampleResponse {
  String? sessionToken;
  String? status;
  String? action;
  Content? content;

  SampleResponse({
    this.sessionToken,
    this.status,
    this.action,
    this.content,
  });

  factory SampleResponse.fromJson(Map<String, dynamic> json) {
    return SampleResponse(
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

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SampleResponse) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      sessionToken.hashCode ^
      status.hashCode ^
      action.hashCode ^
      content.hashCode;
}
