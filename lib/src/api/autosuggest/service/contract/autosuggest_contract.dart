import 'package:skyscanner_api/src/network/network_exports.dart';

import '../../autosuggest_exports.dart';

abstract class AutosuggestContract extends NetworkService {
  Future<HotelResponse> getHotel(HotelEntity hotelEntity);
  Future<AutosuggestFlightResponse> getAutosuggestFlight(
      AutosuggestFlightEntity autosuggestFlightEntity);
  Future<CarHireResponse> getCarHire(CarHireEntity carHireEntity);
}
