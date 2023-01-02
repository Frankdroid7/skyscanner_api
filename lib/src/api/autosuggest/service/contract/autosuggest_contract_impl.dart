import 'package:dio/dio.dart';
import 'package:skyscanner_api/src/api/autosuggest/entity/autosuggest_flight_entity.dart';
import 'package:skyscanner_api/src/api/autosuggest/entity/carhire_entity.dart';
import 'package:skyscanner_api/src/api/autosuggest/entity/hotel_entity.dart';
import 'package:skyscanner_api/src/api/autosuggest/model/autosuggest_flight_response.dart';
import 'package:skyscanner_api/src/api/autosuggest/model/carhire_response.dart';
import 'package:skyscanner_api/src/api/autosuggest/model/hotel_response.dart';
import 'package:skyscanner_api/src/api/autosuggest/service/contract/autosuggest_contract.dart';
import 'package:skyscanner_api/src/network/network_exports.dart';

class AutosuggestContractImpl extends AutosuggestContract {
  @override
  Future<AutosuggestFlightResponse> getAutosuggestFlight(
      AutosuggestFlightEntity autosuggestFlightEntity) async {
    try {
      final Response response = await request(
          path: ApiPath.autosuggestFlights,
          method: RequestType.post,
          data: autosuggestFlightEntity.toJson());

      return AutosuggestFlightResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CarHireResponse> getCarHire(CarHireEntity carHireEntity) async {
    try {
      final Response response = await request(
          path: ApiPath.autosuggestCarHire,
          method: RequestType.post,
          data: carHireEntity.toJson());

      return CarHireResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<HotelResponse> getHotel(HotelEntity hotelEntity) async {
    try {
      final Response response = await request(
          path: ApiPath.autosuggestHotels,
          method: RequestType.post,
          data: hotelEntity.toJson());

      return HotelResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
