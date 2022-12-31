import 'package:skyscanner_api/src/api/flight/live/entity/flight_live_prices_create_entity/flight_live_prices_create_entity.dart';

import '../../../../network/network_exports.dart';
import '../model/flight_live_prices_create_response/flight_live_prices_create_response.dart';

abstract class FlightLiveContract extends NetworkService{
  Future<FlightLivePricesCreateResponse> createLiveFlight(
      FlightLivePricesCreateEntity entity);

  Future<FlightLivePricesCreateResponse> createLiveSearchPoll(
      String sessionToken);

  Future<dynamic> createItineraryRefresh(
      String sessionToken, Map<String, dynamic> itineraryId);

  Future<dynamic> refreshSessionToken(String refreshSessionToken);
}
