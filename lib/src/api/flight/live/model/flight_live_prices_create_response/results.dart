import 'agents.dart';
import 'alliances.dart';
import 'carriers.dart';
import 'itineraries.dart';
import 'legs.dart';
import 'places.dart';
import 'segments.dart';

class Results {
  /// Bookable itinerary which corresponds with what was requested in the search.
  /// A return trip will consist of 2 legs, while a one-way trip will consist of 1 leg.
  /// An itinerary will contain a deepLink field which takes the traveler to the booking page.
  Itineraries? itineraries;

  /// Includes details about the flight leg from destination to origin.
  /// A leg has 1 segment if it is a direct flight, and can have multiple segments if there are multiple stopovers.
  Legs? legs;

  /// Shows the individual stops in a leg.
  /// I.e.: if a leg has 1 stop, the segment will show details about the stopover such as the length of time and where the stopover location is.
  Segments? segments;

  /// Shows the individual stops in a leg.
  /// I.e.: if a leg has 1 stop, the segment will show details about the stopover such as the length of time and where the stopover location is.
  Places? places;

  /// Similar to places, carriers contains information about the airlines referenced in itineraries.
  Carriers? carriers;

  /// Similar to places, agents contains information about the OTAs referenced in itineraries.
  Agents? agents;

  /// List of alliance names
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
