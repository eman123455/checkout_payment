class CustomerSessionInputModel {
  final String customerId;
  final bool mobilePaymentElementEnabled;
  final String paymentMethodSave;
  final String paymentMethodRedisplay;
  final String paymentMethodRemove;

  CustomerSessionInputModel({
    required this.customerId,
    this.mobilePaymentElementEnabled = true,
    this.paymentMethodSave = 'enabled',
    this.paymentMethodRedisplay = 'enabled',
    this.paymentMethodRemove = 'enabled',
  });

  Map<String, dynamic> toJson() {
    return {
      'customer': customerId,
      'components[mobile_payment_element][enabled]':
          mobilePaymentElementEnabled,
      'components[mobile_payment_element][features][payment_method_save]':
          paymentMethodSave,
      'components[mobile_payment_element][features][payment_method_redisplay]':
          paymentMethodRedisplay,
      'components[mobile_payment_element][features][payment_method_remove]':
          paymentMethodRemove,
    };
  }
}
