import 'package:dio/dio.dart';
import 'package:skyscanner_api/src/api/carriers/service/contracts/carriers_contract.dart';
import 'package:skyscanner_api/src/network/network_exports.dart';

class CarriersContractImpl extends CarriersContract {
  @override
  Future<Map<String, dynamic>> getCarriers() async {
    try {
      Response response =
          await request(path: ApiPath.carriers, method: RequestType.get);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
