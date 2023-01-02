class Highlight {
  String? hierarchy;
  String? name;

  Highlight({this.hierarchy, this.name});

  Highlight.fromJson(Map<String, dynamic> json) {
    hierarchy = json['hierarchy'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hierarchy'] = hierarchy;
    data['name'] = name;
    return data;
  }
}
