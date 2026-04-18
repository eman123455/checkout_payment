import 'package:checkout_payment/core/components/custom_button.dart';
import 'package:checkout_payment/core/constants/images.dart';
import 'package:checkout_payment/core/resources/app_text_styles.dart';
import 'package:checkout_payment/features/checkout/presentation/widgets/cart_row_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height:20.h,),
            Expanded(child: Image.asset(Images.basketImagePath)),
            SizedBox(height: 25.h,),
            CartRowInfo(title: 'Order Subtotal',price: '\$42.97',style: AppTextStyles.style18,),
            SizedBox(height: 3.h,),
            CartRowInfo(title: 'Discount',price: '\$0',style: AppTextStyles.style18,),
            SizedBox(height: 3.h,),
            CartRowInfo(title: 'Shipping',price: '\$8',style: AppTextStyles.style18,),
            Divider(
              color: Color(0xffC7C7C7),
              thickness: 2,
              height: 34,
            ),
            CartRowInfo(title: 'Total',price: '\$50',style: AppTextStyles.style24,),
            SizedBox(height: 16.h,),
            CustomButton(text: 'Complete Payment',onPressed: (){},),
            SizedBox(height:40.h,),
          ],
        ),
      ),
    );
  }
}
