class GenericDate {
  int year;
  int month;
  int? day;

  GenericDate({required this.year, required this.month});

  factory GenericDate.fromJson(Map<String, dynamic> json) => GenericDate(
        year: json['year'] as int,
        month: json['month'] as int,
      );

  Map<String, dynamic> toJson() => {
        'year': year,
        'month': month,
        'day': day,
      };
}
