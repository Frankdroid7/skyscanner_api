class EndDate {
  int? year;
  int? month;

  EndDate({this.year, this.month});

  factory EndDate.fromJson(Map<String, dynamic> json) => EndDate(
        year: json['year'] as int?,
        month: json['month'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'year': year,
        'month': month,
      };
}
