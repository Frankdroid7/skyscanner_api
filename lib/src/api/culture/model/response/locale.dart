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

class Locales {
  String? code;
  String? name;

  Locales({this.code, this.name});

  Locales.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }
}
