import '../../../../../skyscanner_export.dart';
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
  Future<FlightLivePricesCreateResponse> createItineraryRefresh(
      {required String sessionToken, required String itineraryId}) async {
    try {
      final response = await request(
          path: '${ApiPath.createItineraryRefresh}$sessionToken',
          method: RequestType.post,
          data: {"itineraryId": itineraryId});
      return FlightLivePricesCreateResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FlightLivePricesCreateResponse> pollItineraryRefresh(
      {required String refreshSessionToken}) async {
    try {
      final response = await request(
          path:
              '${ApiPath.createItineraryRefreshSessionToken}$refreshSessionToken',
          method: RequestType.get);
      return FlightLivePricesCreateResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
