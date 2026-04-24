import 'package:flutter/material.dart';

class CustomRowInfo extends StatelessWidget {
  const CustomRowInfo({super.key, required this.title, required this.price, this.style});
  final String title;
  final String price;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(title, style: style),
        Text(price, style: style),
      ],
    );
  }
}
