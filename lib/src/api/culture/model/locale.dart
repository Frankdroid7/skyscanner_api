class LocaleResponse {
  String? status;
  List<LocaleResponse>? locales;

  LocaleResponse({this.status, this.locales});

  LocaleResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['locales'] != null) {
      locales = <LocaleResponse>[];
      json['locales'].forEach((v) {
        locales!.add(LocaleResponse.fromJson(v));
      });
    }
  }
}

/// Locale that Skyscanner supports.
class LocaleData {
  /// Locale code, e.g.: en-GB
  String? code;

  /// The locale name, e.g.: English (United Kingdom)
  String? name;

  LocaleData({this.code, this.name});

  LocaleData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }
}
