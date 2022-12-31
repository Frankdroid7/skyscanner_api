import 'package:skyscanner_api/src/api/flight/live/entity/flight_live_prices_create_entity/flight_live_prices_create_entity.dart';
import 'package:skyscanner_api/src/api/flight/live/model/flight_live_prices_create_response/flight_live_prices_create_response.dart';

import '../../../../network/network_exports.dart';
import 'flight_live_contract.dart';

class FlightLiveContractImpl implements FlightLiveContract {
  NetworkService networkService = NetworkService();

  @override
  Future<FlightLivePricesCreateResponse> createLiveFlight(
      FlightLivePricesCreateEntity entity) async {
    try {
      final response = await networkService.request(
          path: ApiPath.createFlightsLiveSearch,
          method: RequestType.post,
          data: entity.toJson());
      return FlightLivePricesCreateResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
