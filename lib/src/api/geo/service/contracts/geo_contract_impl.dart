import 'package:dio/dio.dart';
import 'package:skyscanner_api/src/api/geo/service/contracts/geo_contract.dart';

import '../../../../network/network_exports.dart';
import '../../entity/nearest_flight_entity.dart';
import '../../model/geo_flight_response.dart';

class GeoContractImpl extends GeoContract {
  @override
  Future<GeoFlightResponse> getGeoFlights(String locale) async {
    try {
      Response response = await request(
          path: '${ApiPath.geoFlights}/$locale', method: RequestType.get);
      return GeoFlightResponse.fromMap(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getGeoNearestFlights(
      NearestFlightEntity nearestFlight) async {
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
