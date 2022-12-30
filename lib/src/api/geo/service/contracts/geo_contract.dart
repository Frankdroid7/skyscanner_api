import 'package:skyscanner_api/src/network/network_exports.dart';

import '../../entity/nearest_flights_entity.dart';

abstract class GeoContract extends NetworkService {
  Future<Map<String, dynamic>> getGeoFlights(String locale);
  Future<Map<String, dynamic>> getGeoNearestFlights(
      NearestFlight nearestFlight);
}