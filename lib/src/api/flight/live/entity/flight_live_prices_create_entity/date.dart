class SkyScannerDate {
  int year;
  int month;
  int day;

  SkyScannerDate({required this.year, required this.month, required this.day});

  factory SkyScannerDate.fromJson(Map<String, dynamic> json) => SkyScannerDate(
        year: json['year'] as int,
        month: json['month'] as int,
        day: json['day'] as int,
      );

  Map<String, dynamic> toJson() => {
        'year': year,
        'month': month,
        'day': day,
      };
}
