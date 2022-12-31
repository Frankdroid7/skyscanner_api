class SortingOptions {
  List<dynamic>? best;
  List<dynamic>? cheapest;
  List<dynamic>? fastest;

  SortingOptions({this.best, this.cheapest, this.fastest});

  factory SortingOptions.fromJson(Map<String, dynamic> json) {
    return SortingOptions(
      best: json['best'] as List<dynamic>?,
      cheapest: json['cheapest'] as List<dynamic>?,
      fastest: json['fastest'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'best': best,
        'cheapest': cheapest,
        'fastest': fastest,
      };
}
