import 'package:checkout_payment/core/components/custom_button.dart';
import 'package:checkout_payment/core/constants/images.dart';
import 'package:checkout_payment/core/resources/app_routes.dart';
import 'package:checkout_payment/core/resources/app_text_styles.dart';
import 'package:checkout_payment/features/checkout/presentation/widgets/custom_row_info.dart';
import 'package:checkout_payment/features/checkout/presentation/widgets/payment_methods_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Expanded(child: Image.asset(Images.basketImagePath)),
            SizedBox(height: 25.h),
            CustomRowInfo(
              title: 'Order Subtotal',
              price: '\$42.97',
              style: AppTextStyles.style18,
            ),
            SizedBox(height: 3.h),
            CustomRowInfo(
              title: 'Discount',
              price: '\$0',
              style: AppTextStyles.style18,
            ),
            SizedBox(height: 3.h),
            CustomRowInfo(
              title: 'Shipping',
              price: '\$8',
              style: AppTextStyles.style18,
            ),
            Divider(color: Color(0xffC7C7C7), thickness: 2, height: 34),
            CustomRowInfo(
              title: 'Total',
              price: '\$50',
              style: AppTextStyles.style24,
            ),
            SizedBox(height: 16.h),
            CustomButton(
              text: 'Complete Payment',
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return PaymentMethodsBottomSheet();
                  },
                );
                // context.push(AppRoutes.kPaymentDetailsView);
              },
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
