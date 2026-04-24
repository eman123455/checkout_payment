import 'package:checkout_payment/core/resources/app_colors.dart';
import 'package:checkout_payment/core/resources/app_text_styles.dart';
import 'package:checkout_payment/features/checkout/presentation/widgets/card_info_widget.dart';
import 'package:checkout_payment/features/checkout/presentation/widgets/custom_row_info.dart';
import 'package:checkout_payment/features/checkout/presentation/widgets/paid_button.dart';
import 'package:checkout_payment/features/checkout/presentation/widgets/payment_row_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ThankYouCard extends StatelessWidget {
  const ThankYouCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
          decoration: ShapeDecoration(
            color: AppColors.kGreyE9,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            )
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 50+16,left: 22,right: 22),
              child: Column(
                children: [
                  Text('Thank you!',style: AppTextStyles.style25,),
                  Text('Your transaction was successful',style: AppTextStyles.style20,),
                  SizedBox(height: 42.h,),
                  PaymentRowInfo(title: 'Date', info:'01/24/2023'),
                  SizedBox(height: 20.h,),
                  PaymentRowInfo(title: 'Time', info:'10:15 AM'),
                  SizedBox(height: 20.h,),
                  PaymentRowInfo(title: 'To', info:'Sam Louis'),
                  Divider(
                    height: 60,
                    thickness: 2,
                  ),
                  CustomRowInfo(
              title: 'Total',
              price: '\$50',
              style: AppTextStyles.style24,
            ),
            SizedBox(height: 30.h,),
            CardInfoWidget(),
            Spacer(),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                FaIcon(FontAwesomeIcons.barcode,size: 64,),
                PaidButton()
              ],
            ),
            SizedBox(height:( (MediaQuery.sizeOf(context).height*0.2+20)/2)-28,)
                ],
              ),
            ),
        );
  }
}