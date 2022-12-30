import 'package:collection/collection.dart';

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

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SortingOptions) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => best.hashCode ^ cheapest.hashCode ^ fastest.hashCode;
}
