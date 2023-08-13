// ignore_for_file: constant_identifier_names

enum CabinClass {
  /// Cabin class is unspecified.
  CABIN_CLASS_UNSPECIFIED,

  /// Cabin class is economy.
  CABIN_CLASS_ECONOMY,

  /// Cabin class is premium economy.
  CABIN_CLASS_PREMIUM_ECONOMY,

  /// Cabin class is business.
  CABIN_CLASS_BUSINESS,

  /// Cabin class is first class.
  CABIN_CLASS_FIRST;

  //Create method to return enum from string
  static CabinClass fromString(String str) {
    return CabinClass.values.firstWhere((e) => e.toString() == str);
  }
}
