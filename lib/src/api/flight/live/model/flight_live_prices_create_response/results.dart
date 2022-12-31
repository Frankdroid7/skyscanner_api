import 'agents.dart';
import 'alliances.dart';
import 'carriers.dart';
import 'itineraries.dart';
import 'legs.dart';
import 'places.dart';
import 'segments.dart';

class Results {
  Itineraries? itineraries;
  Legs? legs;
  Segments? segments;
  Places? places;
  Carriers? carriers;
  Agents? agents;
  Alliances? alliances;

  Results({
    this.itineraries,
    this.legs,
    this.segments,
    this.places,
    this.carriers,
    this.agents,
    this.alliances,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        itineraries: json['itineraries'] == null
            ? null
            : Itineraries.fromJson(json['itineraries'] as Map<String, dynamic>),
        legs: json['legs'] == null
            ? null
            : Legs.fromJson(json['legs'] as Map<String, dynamic>),
        segments: json['segments'] == null
            ? null
            : Segments.fromJson(json['segments'] as Map<String, dynamic>),
        places: json['places'] == null
            ? null
            : Places.fromJson(json['places'] as Map<String, dynamic>),
        carriers: json['carriers'] == null
            ? null
            : Carriers.fromJson(json['carriers'] as Map<String, dynamic>),
        agents: json['agents'] == null
            ? null
            : Agents.fromJson(json['agents'] as Map<String, dynamic>),
        alliances: json['alliances'] == null
            ? null
            : Alliances.fromJson(json['alliances'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'itineraries': itineraries?.toJson(),
        'legs': legs?.toJson(),
        'segments': segments?.toJson(),
        'places': places?.toJson(),
        'carriers': carriers?.toJson(),
        'agents': agents?.toJson(),
        'alliances': alliances?.toJson(),
      };
}
