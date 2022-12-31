class Legs {
  final Map<String, dynamic>? data;

  Legs({this.data});

  factory Legs.fromJson(Map<String, dynamic> json) => Legs(data: json);

  Map<String, dynamic> toJson() => data ?? {};
}
