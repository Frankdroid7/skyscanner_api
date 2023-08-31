import 'package:skyscanner_api/src/api/flight/export_flight.dart';

import '../../../../network/network_exports.dart';

abstract class IndicativeSearchContract extends NetworkService {
  Future<FlightLivePricesCreateResponse> indicativeSearch(
      IndicativeSearchEntity entity);
}
