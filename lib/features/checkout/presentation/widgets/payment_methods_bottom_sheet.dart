import 'package:checkout_payment/core/components/custom_button.dart';
import 'package:checkout_payment/features/checkout/presentation/widgets/payment_methods_List_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16,top: 32,bottom: 16),
      child: Column(
        mainAxisSize: .min,
        children: [
          PaymentMethodsListView(),
          SizedBox(height: 32.h,),
          CustomButton(text: 'Continue',onPressed: (){},)
        ],
      ),
    );
  }
}