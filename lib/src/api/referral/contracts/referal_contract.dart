import 'package:skyscanner_api/src/api/referral/entity/referral_entity.dart';

abstract class ReferralContract {
  Future<Map<String, dynamic>> getFlightsDayView({ReferralEntity? entity});
  Future<Map<String, dynamic>> getCarsDayView({ReferralEntity? entity});
}
