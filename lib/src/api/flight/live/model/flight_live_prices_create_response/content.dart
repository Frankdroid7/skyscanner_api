import 'results.dart';
import 'sorting_options.dart';
import 'stats.dart';

class Content {
  Results? results;
  Stats? stats;
  SortingOptions? sortingOptions;

  Content({this.results, this.stats, this.sortingOptions});

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        results: json['results'] == null
            ? null
            : Results.fromJson(json['results'] as Map<String, dynamic>),
        stats: json['stats'] == null
            ? null
            : Stats.fromJson(json['stats'] as Map<String, dynamic>),
        sortingOptions: json['sortingOptions'] == null
            ? null
            : SortingOptions.fromJson(
                json['sortingOptions'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'results': results?.toJson(),
        'stats': stats?.toJson(),
        'sortingOptions': sortingOptions?.toJson(),
      };
}
