import 'package:checkout_payment/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Cart',style: AppTextStyles.style25),
        centerTitle: true,
      ) ,
      );
  }
}