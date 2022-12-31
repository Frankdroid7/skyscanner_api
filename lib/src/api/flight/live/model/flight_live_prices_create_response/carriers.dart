class Carriers {
  final Map<String, dynamic>? data;
  Carriers({this.data});

  factory Carriers.fromJson(Map<String, dynamic> json) => Carriers(data: json);

  Map<String, dynamic> toJson() => data ?? {};
}
