import 'package:checkout_payment/core/components/custom_app_bar.dart';
import 'package:checkout_payment/core/resources/app_colors.dart';
import 'package:checkout_payment/features/checkout/presentation/widgets/thanks_you_view_body.dart';
import 'package:flutter/material.dart';

class ThanksYouView extends StatelessWidget {
  const ThanksYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: SafeArea(
        child: Stack(
          children: [
           CustomAppBar(title: ''),
            Transform.translate(
              offset: const Offset(0,16),
              child: const ThanksYouViewBody(),
            ),
          ],
        ),
      ),
    );
  }
}