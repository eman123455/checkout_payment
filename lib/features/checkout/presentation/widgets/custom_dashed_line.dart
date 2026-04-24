import 'package:checkout_payment/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDashedLine extends StatelessWidget {
  const CustomDashedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
            children: List.generate(
              30, 
              (index)=>Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Container(
                    color: AppColors.kGreyB8,
                    height: 1.h,
                  ),
                ),
                ),
                ),
          );
  }
}