class Agents {
  final Map<String, dynamic>? data;
  Agents({this.data});

  factory Agents.fromJson(Map<String, dynamic> json) => Agents(data: json);

  Map<String, dynamic> toJson() => data ?? {};
}
