import 'package:skyscanner_api/src/api/flight/indicative/entity/indicative_search_entity/indicative_search_entity.dart';

abstract class IndicativeSearchContract {
  Future<dynamic> indicativeSearch(IndicativeSearchEntity entity);
}
