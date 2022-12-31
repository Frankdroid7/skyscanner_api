class Itineraries {
  final Map<String, dynamic>? data;
  Itineraries({this.data});

  factory Itineraries.fromJson(Map<String, dynamic> json) =>
      Itineraries(data: json);

  Map<String, dynamic> toJson() => data ?? {};
}
