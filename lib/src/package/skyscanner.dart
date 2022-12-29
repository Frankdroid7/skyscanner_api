import '../common/common_export.dart';
import '../manager/manager_exports.dart';

class SkyScannerApi {
  String _apiKey = "";
  SkyScannerManager? _scannerManager;

  /// Initialize the SkyScanner object. It should be called as early as possible
  /// (preferably in initState() of the Widget.
  ///
  /// [apiKey] - your SkyScanner Api key. This is mandatory
  Future<void> initializeApiKey({required String apiKey}) async {
    assert(() {
      if (apiKey.isEmpty) {
        throw SkyScannerException('apiKey cannot be null or empty');
      }
      if (!apiKey.startsWith("prt") || apiKey.length != 32) {
        throw AuthenticationException(Utils.getApiKeyErrorMsg('ApiKey'));
      }
      return true;
    }());

    _apiKey = apiKey;

    /// Initialize scanner manager
    _scannerManager = SkyScannerManager(_apiKey);
  }

  /// Resets the value of the api key to be empty
  void dispose() {
    _apiKey = "";
  }

  /// make request to sample data
  Future<dynamic> sampleData() async => await _scannerManager?.sampleData();
}
