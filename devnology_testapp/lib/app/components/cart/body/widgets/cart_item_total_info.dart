import 'package:flutter/material.dart';

import '../../../../config/app_fonts.dart';

class CartItemTotalInfo extends StatelessWidget {
  final double totalPrice;
  const CartItemTotalInfo({
    Key? key,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total',
                style: AppFonts.cartTotalLabel,
              ),
              Text(
                '\$ ${totalPrice.toStringAsPrecision(6)}',
                style: AppFonts.cartTotalPrice,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
