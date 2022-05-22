import 'package:devnology_testapp/app/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_fonts.dart';

class CartItemInfo extends StatelessWidget {
  final int id;
  final String label;
  final double price;
  final int numQuantity;
  const CartItemInfo({
    Key? key,
    required this.id,
    required this.label,
    required this.price,
    required this.numQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppController appController = AppController();
    return Observer(
      builder: (context) => Container(
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
                  onTap: () {
                    appController.decrementItemQuantity(numQuantity);
                    print('decrement: $numQuantity');
                  },
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
                    appController.quantity.toString(),
                    style: AppFonts.cartNumText,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    appController.incrementItemQuantity(numQuantity);
                    print('increment: $numQuantity');
                  },
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
      ),
    );
  }
}
