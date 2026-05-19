class PaymentIntentInputModel {
  String? amount;
  String? currency;

  PaymentIntentInputModel({
    this.amount,
    this.currency,
  });
  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'currency': currency,
    };
  }
}