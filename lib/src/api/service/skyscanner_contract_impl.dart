import '../model/sample_response/sample_response.dart';
import 'contracts/skyscanner_contract.dart';
import '../../network/network_exports.dart';

class SkyScannerContractImpl implements SkyScannerContract {
  final networkService = NetworkService();

  @override
  Future<SampleResponse> sampleData(String apiKey) async {
    Map<String, dynamic> map = {
      "query": {
        "market": "UK",
        "locale": "en-GB",
        "currency": "GBP",
        "query_legs": [
          {
            "origin_place_id": {"iata": "LHR"},
            "destination_place_id": {"iata": "SIN"},
            "date": {"year": 2022, "month": 12, "day": 22}
          }
        ],
        "adults": 1,
        "cabin_class": "CABIN_CLASS_ECONOMY"
      }
    };
    try {
      final response = await networkService.request(
          path: ApiPath.sample,
          apiKey: apiKey,
          method: RequestMethod.post,
          data: map);
      return SampleResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
