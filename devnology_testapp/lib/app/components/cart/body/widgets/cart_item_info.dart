import 'package:flutter/material.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_fonts.dart';

class CartItemInfo extends StatelessWidget {
  final String label;
  final double price;
  final int numQuantity;
  const CartItemInfo({
    Key? key,
    required this.label,
    required this.price,
    required this.numQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 204,
            height: 41,
            child: Text(
              label,
              overflow: TextOverflow.fade,
              style: AppFonts.cartLabel,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: Text(
              '\$ $price',
              style: AppFonts.cartPrice,
            ),
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  height: 14,
                  width: 14,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    '-',
                    style: AppFonts.cartIconText,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 11),
                child: Text(
                  '$numQuantity',
                  style: AppFonts.cartNumText,
                ),
              ),
              GestureDetector(
                child: Container(
                  height: 14,
                  width: 14,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 11),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    '+',
                    style: AppFonts.cartIconText,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
