class Stats {
  dynamic itineraries;

  Stats({this.itineraries});

  factory Stats.fromJson(Map<String, dynamic> json) =>
      Stats(itineraries: json['itineraries'] as dynamic);

  Map<String, dynamic> toJson() => {'itineraries': itineraries};
}
