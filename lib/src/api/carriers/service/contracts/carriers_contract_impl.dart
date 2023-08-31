import 'package:dio/dio.dart';
import 'package:skyscanner_api/src/api/carriers/service/contracts/carriers_contract.dart';
import 'package:skyscanner_api/src/network/network_exports.dart';

import '../../model/carriers_response.dart';

class CarriersContractImpl extends CarriersContract {
  @override
  Future<CarriersResponse> getCarriers() async {
    try {
      Response response =
          await request(path: ApiPath.carriers, method: RequestType.get);
      return CarriersResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
