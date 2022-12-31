import 'package:skyscanner_api/src/api/referral/entity/referral_entity.dart';

import '../../../network/network_exports.dart';
import 'referal_contract.dart';

class ReferralContractImpl extends ReferralContract {
  final networkService =
      NetworkService(mbaseUrl: 'https://www.skyscanner.net/g/referrals/v1/');
  @override
  Future<Map<String, dynamic>> getCarsDayView({ReferralEntity? entity}) async {
    try {
      final response = await networkService.request(
          path: ApiPath.carsDayView,
          method: RequestType.get,
          queryParams: entity?.toJson());
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getFlightsDayView(
      {ReferralEntity? entity}) async {
    try {
      final response = await networkService.request(
          path: ApiPath.flightsDayView,
          method: RequestType.get,
          queryParams: entity?.toJson());
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
