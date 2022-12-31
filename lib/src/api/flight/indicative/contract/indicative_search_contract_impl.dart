import 'package:skyscanner_api/src/api/flight/indicative/entity/indicative_search_entity/indicative_search_entity.dart';

import '../../../../network/network_exports.dart';
import 'indicative_search_contract.dart';

class IndicativeSearchContractImpl implements IndicativeSearchContract {
  NetworkService networkService = NetworkService();

  @override
  Future<dynamic> indicativeSearch(IndicativeSearchEntity entity) async {
    try {
      final response = await networkService.request(
          path: ApiPath.indicativeSearch,
          method: RequestType.post,
          data: entity.toJson());
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
