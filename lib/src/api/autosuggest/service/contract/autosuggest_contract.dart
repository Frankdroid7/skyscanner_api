import 'package:skyscanner_api/src/api/autosuggest/entity/autosuggest_flight_entity.dart';
import 'package:skyscanner_api/src/api/autosuggest/entity/carhire_entity.dart';
import 'package:skyscanner_api/src/api/autosuggest/entity/hotel_entity.dart';
import 'package:skyscanner_api/src/network/network_exports.dart';

import '../../autosuggest_exports.dart';

abstract class AutosuggestContract extends NetworkService {
  Future<HotelResponse> getHotel(HotelEntity hotelEntity);
  Future<AutosuggestFlightResponse> getAutosuggestFlight(
      AutosuggestFlightEntity autosuggestFlightEntity);
  Future<CarHireResponse> getCarHire(CarHireEntity carHireEntity);
}
