import 'package:checkout_payment/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';

class PaymentRowInfo extends StatelessWidget {
  const PaymentRowInfo({super.key, required this.title, required this.info,});
  final String title;
  final String info;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(title, style: AppTextStyles.style18),
        Text(info, style: AppTextStyles.style18Bold),
      ],
    );
  }
}