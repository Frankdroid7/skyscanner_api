import 'package:skyscanner_api/src/api/referral/entity/referral_entity.dart';
import 'package:skyscanner_api/src/network/network_exports.dart';

abstract class ReferralContract {
  Future<Map<String, dynamic>> getFlightsDayView({ReferralEntity? entity});
  Future<Map<String, dynamic>> getCarsDayView({ReferralEntity? entity});
}
