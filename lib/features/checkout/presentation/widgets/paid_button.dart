import 'package:checkout_payment/core/resources/app_colors.dart';
import 'package:checkout_payment/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';

class PaidButton extends StatelessWidget {
  const PaidButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 14),
      decoration: ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.5,
            color:  AppColors.kGreen 
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
        color: Colors.transparent,

          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text('PAID',style: AppTextStyles.style24.copyWith(color: AppColors.kGreen),),
        ),
      ),
    );
  }
}