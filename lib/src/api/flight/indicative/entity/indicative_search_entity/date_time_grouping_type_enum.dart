// ignore_for_file: constant_identifier_names

//Allows specifying how the response will be grouped
enum DateTimeGroupingType {
  // The date grouping is not specified (use the default).
  DATE_TIME_GROUPING_TYPE_UNSPECIFIED,

  // Group the quotes by day.
  DATE_TIME_GROUPING_TYPE_BY_DATE,

  //Group the quotes by month.
  DATE_TIME_GROUPING_TYPE_BY_MONTH;

  static DateTimeGroupingType fromString(String type) {
    return DateTimeGroupingType.values.firstWhere((str) => type == str.name);
  }
}
