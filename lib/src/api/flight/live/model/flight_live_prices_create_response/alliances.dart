class Alliances {
  final Map<String, dynamic>? data;
  Alliances({this.data});

  factory Alliances.fromJson(Map<String, dynamic> json) =>
      Alliances(data: json);

  Map<String, dynamic> toJson() => data ?? {};
}
