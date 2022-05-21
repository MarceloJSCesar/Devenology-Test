import 'package:flutter/material.dart';

import '../../../../config/app_fonts.dart';
import '../../../../config/app_colors.dart';

class CartItemCheckoutButton extends StatelessWidget {
  final Function onTap;
  final String itemArrowRightImg;
  const CartItemCheckoutButton({
    Key? key,
    required this.onTap,
    required this.itemArrowRightImg,
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
              'CHECKOUT',
              style: AppFonts.detailsAddToCart,
            ),
            GestureDetector(
              child: Image(
                image: AssetImage(itemArrowRightImg),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
