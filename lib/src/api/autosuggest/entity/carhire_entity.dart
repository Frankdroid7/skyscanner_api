class CarHireEntity {
  CarHireQuery? query;

  CarHireEntity({this.query});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['query'] = query?.toJson();
    return data;
  }
}

class CarHireQuery {
  String market;
  String locale;
  String searchTerm;

  CarHireQuery(
      {required this.market, required this.locale, required this.searchTerm});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['market'] = market;
    data['locale'] = locale;
    data['searchTerm'] = searchTerm;
    return data;
  }
}
