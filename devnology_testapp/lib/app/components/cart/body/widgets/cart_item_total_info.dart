import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';

import '../../../../config/app_fonts.dart';

class CartItemTotalInfo extends StatelessWidget {
  final double totalPrice;
  const CartItemTotalInfo({
    Key? key,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoneyFormatter fm = MoneyFormatter(amount: totalPrice);
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
                fm.output.symbolOnLeft,
                style: AppFonts.cartTotalPrice,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
