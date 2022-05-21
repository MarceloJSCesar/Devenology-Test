import 'package:flutter/material.dart';

import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';

class CheckoutCircleDone extends StatelessWidget {
  const CheckoutCircleDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 101,
      height: 101,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary,
        image: DecorationImage(
          image: AssetImage(AppAssets.done),
        ),
      ),
    );
  }
}
