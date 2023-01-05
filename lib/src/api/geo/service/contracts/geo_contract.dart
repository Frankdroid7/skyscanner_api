import 'package:skyscanner_api/src/network/network_exports.dart';

import '../../entity/nearest_flight_entity.dart';
import '../../model/geo_flight_response.dart';

abstract class GeoContract extends NetworkService {
  Future<GeoFlightResponse> getGeoFlights(String locale);
  Future<Map<String, dynamic>> getGeoNearestFlights(
      NearestFlightEntity nearestFlight);
}
