import '../../../../../skyscanner_export.dart';
import '../../../../network/network_exports.dart';

abstract class FlightLiveContract extends NetworkService {
  Future<FlightLivePricesCreateResponse> createLiveFlight(
      FlightLivePricesCreateEntity entity);

  Future<FlightLivePricesCreateResponse> createLiveSearchPoll(
      String sessionToken);

  Future<FlightLivePricesCreateResponse> createItineraryRefresh(
      {required String sessionToken, required String itineraryId});

  Future<FlightLivePricesCreateResponse> pollItineraryRefresh(
      {required String refreshSessionToken});
}
