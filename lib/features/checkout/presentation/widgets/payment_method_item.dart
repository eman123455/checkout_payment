import 'package:checkout_payment/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.imagePath,
    required this.isActive, this.child,
  });
  final String imagePath;
  final bool isActive;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104.h,
      height: 62.h,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.5,
            color: isActive ? AppColors.kGreen : AppColors.kGrey,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [
          BoxShadow(
            color: isActive ? AppColors.kGreen : AppColors.kWhite,
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.kWhite,
        ),
        child: Center(
          child: SvgPicture.asset(imagePath, height: 24, fit: .scaleDown),
        ),
      ),
    );
  }
}
