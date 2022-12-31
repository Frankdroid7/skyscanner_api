class Segments {
  final Map<String, dynamic>? data;

  Segments({this.data});

  factory Segments.fromJson(Map<String, dynamic> json) => Segments(data: json);

  Map<String, dynamic> toJson() => data ?? {};
}
