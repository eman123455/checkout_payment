import 'package:checkout_payment/core/resources/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
  minTextAdapt: true,
  splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
       debugShowCheckedModeBanner: false,
       routerConfig: AppRoutes.routes,
      ), 
    );
  }
}
