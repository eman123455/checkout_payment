import 'package:checkout_payment/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        title: Text('Cart',style: AppTextStyles.style25),
        centerTitle: true,
        leading: Center(child: SvgPicture.asset('assets/images/arrow.svg')),
      ) ,
      );
  }
}