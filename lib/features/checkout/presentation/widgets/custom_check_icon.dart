import 'package:checkout_payment/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.kGreyE9,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: AppColors.kGreen,
                child: Icon(Icons.check,size: 50,color: AppColors.kWhite,),
              ),
            );
  }
}