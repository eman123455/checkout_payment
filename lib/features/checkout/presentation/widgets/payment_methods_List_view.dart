import 'package:checkout_payment/core/constants/constants.dart';
import 'package:checkout_payment/features/checkout/presentation/widgets/payment_method_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62.h,
      child: ListView.builder(
        scrollDirection: .horizontal,
        itemCount: Constants.paymentMethods.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
              activeIndex = index;
                 
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: PaymentMethodItem(
                imagePath: Constants.paymentMethods[index],
                isActive: activeIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
