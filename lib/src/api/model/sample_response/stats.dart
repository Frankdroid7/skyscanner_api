import 'package:collection/collection.dart';

class Stats {
  dynamic itineraries;

  Stats({this.itineraries});

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        itineraries: json['itineraries'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'itineraries': itineraries,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Stats) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => itineraries.hashCode;
}
