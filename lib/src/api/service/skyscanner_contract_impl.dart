import '../model/sample_response/sample_response.dart';
import 'contracts/skyscanner_contract.dart';
import '../../network/network_exports.dart';

class SkyScannerContractImpl implements SkyScannerContract {
  final networkService = NetworkService();
}
