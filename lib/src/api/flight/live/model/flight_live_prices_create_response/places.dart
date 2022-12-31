class Places {
  final Map<String, dynamic>? data;

  Places({this.data});

  factory Places.fromJson(Map<String, dynamic> json) => Places(data: json);

  Map<String, dynamic> toJson() => data ?? {};
}
