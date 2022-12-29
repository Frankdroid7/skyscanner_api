import 'package:skyscanner_api/src/api/service/skyscanner_contract_impl.dart';

import '../api/model/model_exports.dart';

/// Wrapper class to manage all of Skyscanner Contract Implementations
class SkyScannerManager {
  final _skyScannerContractImpl = SkyScannerContractImpl();

  late final String _apiKey;

  SkyScannerManager(this._apiKey);

  Future<SampleResponse> sampleData() async {
    try {
      return await _skyScannerContractImpl.sampleData(_apiKey);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
