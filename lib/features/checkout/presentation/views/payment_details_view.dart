import 'package:checkout_payment/core/components/custom_app_bar.dart';
import 'package:checkout_payment/features/checkout/presentation/widgets/payment_details_view_body.dart';
import 'package:flutter/material.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Payment Details'),
      body: PaymentDetailsViewBody(),
    );
  }
}