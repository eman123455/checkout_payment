class InitPaymentSheetInputModel {
  final String? paymentIntentClientSecret;
  final String? customerSessionClientSecret;
  final String? customerId;

  InitPaymentSheetInputModel({
    this.paymentIntentClientSecret,
    this.customerSessionClientSecret,
    this.customerId,
  });

  Map<String, dynamic> toJson() {
    return {
      'paymentIntentClientSecret': paymentIntentClientSecret,
      'customerSessionClientSecret': customerSessionClientSecret,
      'customerId': customerId,
    };
  }
}