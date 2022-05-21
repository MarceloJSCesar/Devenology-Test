import 'package:flutter/material.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';

class CheckoutAppBar extends StatelessWidget {
  const CheckoutAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: .0,
      toolbarHeight: 60,
      centerTitle: true,
      title: const Image(
        width: 170,
        height: 26.97,
        image: AssetImage(AppAssets.logo),
      ),
      automaticallyImplyLeading: true,
      backgroundColor: AppColors.primary,
    );
  }
}
