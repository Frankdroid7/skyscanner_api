class CarriersResponse {
  String status;
  Map<String, CarriersData> carriers;

  CarriersResponse({required this.carriers, required this.status});

  factory CarriersResponse.fromJson(Map<String, dynamic> json) {
    Map map = json['carriers'];
    return CarriersResponse(
        status: json['status'],
        carriers: map
            .map((key, value) => MapEntry(key, CarriersData.fromJson(value))));
  }
}

class CarriersData {
  String? name;
  String? iata;
  String? icao;
  String? displayCode;

  CarriersData({this.name, this.iata, this.icao, this.displayCode});

  CarriersData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    iata = json['iata'];
    icao = json['icao'];
    displayCode = json['displayCode'];
  }
}
