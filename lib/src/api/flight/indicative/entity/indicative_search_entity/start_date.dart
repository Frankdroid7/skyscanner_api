class StartDate {
  int? year;
  int? month;

  StartDate({this.year, this.month});

  factory StartDate.fromJson(Map<String, dynamic> json) => StartDate(
        year: json['year'] as int?,
        month: json['month'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'year': year,
        'month': month,
      };
}
