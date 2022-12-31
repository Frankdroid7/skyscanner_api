import 'package:skyscanner_api/src/api/flight/indicative/entity/indicative_search_entity/indicative_search_entity.dart';

import '../../../../network/network_exports.dart';

abstract class IndicativeSearchContract extends NetworkService {
  Future<dynamic> indicativeSearch(IndicativeSearchEntity entity);
}
