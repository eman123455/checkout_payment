class PaymentIntentInputModel {
  String amount;
  String currency;
  String customerId;
  PaymentIntentInputModel({required this.amount, required this.currency, required this.customerId});
  Map<String, dynamic> toJson() {
    return {'amount': amount, 'currency': currency, 'customer': customerId};
  }
}
