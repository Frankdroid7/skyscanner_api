import 'package:skyscanner_api/src/network/network_exports.dart';

abstract class CarriersContract extends NetworkService {
  Future<Map<String, dynamic>> getCarriers();
}
