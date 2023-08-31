import 'package:skyscanner_api/src/api/flight/export_flight.dart';
import 'package:skyscanner_api/src/api/flight/indicative/entity/indicative_search_entity/indicative_search_entity.dart';

import '../../../../network/network_exports.dart';
import 'indicative_search_contract.dart';

class IndicativeSearchContractImpl extends IndicativeSearchContract {
  @override
  Future<FlightLivePricesCreateResponse> indicativeSearch(
      IndicativeSearchEntity entity) async {
    try {
      final response = await request(
          path: ApiPath.indicativeSearch,
          method: RequestType.post,
          data: entity.toJson());
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
