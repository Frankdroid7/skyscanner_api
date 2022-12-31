import 'package:skyscanner_api/src/api/flight/live/entity/flight_live_prices_create_entity/flight_live_prices_create_entity.dart';
import 'package:skyscanner_api/src/api/flight/live/model/flight_live_prices_create_response/flight_live_prices_create_response.dart';

import '../../../../network/network_exports.dart';
import 'flight_live_contract.dart';

class FlightLiveContractImpl extends FlightLiveContract {
  @override
  Future<FlightLivePricesCreateResponse> createLiveFlight(
      FlightLivePricesCreateEntity entity) async {
    try {
      final response = await request(
          path: ApiPath.createFlightsLiveSearchCreate,
          method: RequestType.post,
          data: entity.toJson());
      return FlightLivePricesCreateResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FlightLivePricesCreateResponse> createLiveSearchPoll(
      String sessionToken) async {
    try {
      final response = await request(
          path: '${ApiPath.createFlightsLiveSearchPoll}$sessionToken',
          method: RequestType.post);
      return FlightLivePricesCreateResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> createItineraryRefresh(
      String sessionToken, Map<String, dynamic> itineraryId) async {
    try {
      final response = await request(
          path: '${ApiPath.createItineraryRefresh}$sessionToken',
          method: RequestType.post,
          data: itineraryId);
      return response.data ?? {};
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future refreshSessionToken(String refreshSessionToken) async {
    try {
      final response = await request(
          path:
              '${ApiPath.createItineraryRefreshSessionToken}$refreshSessionToken',
          method: RequestType.get);
      return response.data ?? {};
    } catch (e) {
      rethrow;
    }
  }
}
