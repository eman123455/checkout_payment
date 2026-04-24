import 'package:checkout_payment/core/constants/images.dart';
import 'package:checkout_payment/core/resources/app_colors.dart';
import 'package:checkout_payment/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kWhite,
      elevation: 0,
      title: Text(title, style: AppTextStyles.style25),
      centerTitle: true,
      leading: Center(child: IconButton(
  icon: SvgPicture.asset(Images.arrowImagePath),
  onPressed: () {
  },
),),
    );
  }
}
