import '../../model/sample_response/sample_response.dart';

abstract class SkyScannerContract {
  Future<SampleResponse> sampleData(String apiKey);
}
