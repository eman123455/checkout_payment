import 'package:checkout_payment/core/constants/images.dart';
import 'package:checkout_payment/core/resources/app_colors.dart';
import 'package:checkout_payment/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              width: 304.h,
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 22),
              decoration: ShapeDecoration(
                color: AppColors.kWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                )
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(Images.mastercardImagePath),
            SizedBox(width: 20.h,),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Credit Card\n',
                            style: AppTextStyles.style18
                          ),
                          TextSpan(
                            text: 'Mastercard **78'
                          )
                        ]
                      )
                    )

                  ],
                ),
            );
  }
}