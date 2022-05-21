import 'package:flutter/material.dart';

import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_fonts.dart';

class CheckoutButton extends StatelessWidget {
  final Function onTap;
  const CheckoutButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: 140,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'MY ORDERS',
              style: AppFonts.detailsAddToCart,
            ),
            GestureDetector(
              child: const Image(
                image: AssetImage(AppAssets.arrowRight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
