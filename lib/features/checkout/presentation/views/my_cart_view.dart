import 'package:checkout_payment/core/components/custom_app_bar.dart';
import 'package:checkout_payment/core/resources/app_colors.dart';
import 'package:checkout_payment/features/checkout/presentation/widgets/my_cart_view_body.dart';
import 'package:flutter/material.dart';


class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      appBar:CustomAppBar(title: 'Cart',) ,
      body: MyCartViewBody(),
      );
  }
}

