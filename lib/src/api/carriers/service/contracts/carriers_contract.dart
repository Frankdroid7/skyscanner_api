import 'package:skyscanner_api/src/network/network_exports.dart';

import '../../model/carriers_response.dart';

abstract class CarriersContract extends NetworkService {
  Future<CarriersResponse> getCarriers();
}
