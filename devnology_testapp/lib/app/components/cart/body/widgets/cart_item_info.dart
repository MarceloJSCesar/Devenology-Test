import 'package:flutter/material.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_fonts.dart';
import '../../../../models/cart.dart';

class CartItemInfo extends StatelessWidget {
  final Cart cartItem;
  final Function decrement;
  final Function increment;
  const CartItemInfo({
    Key? key,
    required this.cartItem,
    required this.increment,
    required this.decrement,
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
              cartItem.itemLabel,
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
              '\$ ${cartItem.itemPrice}',
              style: AppFonts.cartPrice,
            ),
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () async => await decrement(),
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
                  cartItem.itemQuantity.toString(),
                  style: AppFonts.cartNumText,
                ),
              ),
              GestureDetector(
                onTap: () async => await increment(),
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
