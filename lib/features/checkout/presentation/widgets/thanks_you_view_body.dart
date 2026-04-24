import 'package:checkout_payment/core/resources/app_colors.dart';
import 'package:checkout_payment/features/checkout/presentation/widgets/custom_check_icon.dart';
import 'package:checkout_payment/features/checkout/presentation/widgets/custom_dashed_line.dart';
import 'package:checkout_payment/features/checkout/presentation/widgets/thank_you_card.dart';
import 'package:flutter/material.dart';



class ThanksYouViewBody extends StatelessWidget {
  const ThanksYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Stack(
        clipBehavior: .none,
        children: [
          ThankYouCard(),
          Positioned(
          bottom: MediaQuery.sizeOf(context).height*0.2+20,
          left: 20+8,
          right: 20+8,
          child: CustomDashedLine()
          ),
        Positioned(
          bottom: MediaQuery.sizeOf(context).height*0.2,
          left: -20,
          child: CircleAvatar(
            backgroundColor: AppColors.kWhite,
          )
          ),
        Positioned(
          bottom: MediaQuery.sizeOf(context).height*0.2,
          right: -20,
          child: CircleAvatar(
            backgroundColor: AppColors.kWhite,
          )
          ),
          Positioned(
            left: 0,
            right: 0,
            top: -50,
            child: CustomCheckIcon()
            )
        ]
      ),
    );
  }
}
