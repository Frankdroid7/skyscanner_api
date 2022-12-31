import 'package:dio/dio.dart';
import 'package:skyscanner_api/src/api/geo/service/contracts/geo_contract.dart';

import '../../../network/network_exports.dart';
import '../entity/nearest_flights_entity.dart';

/// Contract implementations for Geo APIs
class GeoContractImpl extends GeoContract {
  @override
  Future<Map<String, dynamic>> getGeoFlights(String locale) async {
    try {
      Response response = await request(
          path: '${ApiPath.geoFlights}/$locale', method: RequestType.get);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getGeoNearestFlights(
      NearestFlight nearestFlight) async {
    try {
      Response response = await request(
        path: ApiPath.geoNearestFlights,
        method: RequestType.post,
        data: nearestFlight.toJson(),
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
