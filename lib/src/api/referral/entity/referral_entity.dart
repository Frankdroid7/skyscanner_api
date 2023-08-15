class ReferralEntity {
  final dynamic mediaPartnerId;
  final dynamic campaignId;
  final String? utmTerm;
  final String? market;
  final String? currency;
  final String? locale;
  final String? origin;
  final String? destination;
  final dynamic outboundDate;
  final dynamic adId;
  final String? pickupPlace;
  final String? dropoffPlace;
  final dynamic pickupTime;
  final dynamic dropoffTime;
  final num? driverAge;

  ReferralEntity(
      {this.mediaPartnerId,
      this.campaignId,
      this.adId,
      this.utmTerm,
      this.market,
      this.currency,
      this.locale,
      this.origin,
      this.destination,
      this.outboundDate,
      this.pickupPlace,
      this.dropoffPlace,
      this.pickupTime,
      this.dropoffTime,
      this.driverAge});

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'mediaPartnerId': mediaPartnerId});
    result.addAll({'campaignId': campaignId});
    if (utmTerm != null) {
      result.addAll({'utm_term': utmTerm});
    }
    if (market != null) {
      result.addAll({'market': market});
    }
    if (currency != null) {
      result.addAll({'currency': currency});
    }
    if (locale != null) {
      result.addAll({'locale': locale});
    }
    if (origin != null) {
      result.addAll({'origin': origin});
    }
    if (destination != null) {
      result.addAll({'destination': destination});
    }
    result.addAll({'outboundDate': outboundDate});
    result.addAll({'adId': adId});
    if (pickupPlace != null) {
      result.addAll({'pickupPlace': pickupPlace});
    }
    if (dropoffPlace != null) {
      result.addAll({'dropoffPlace': dropoffPlace});
    }
    result.addAll({'pickupTime': pickupTime});
    result.addAll({'dropoffTime': dropoffTime});
    if (driverAge != null) {
      result.addAll({'driverAge': driverAge});
    }

    return result;
  }
}
