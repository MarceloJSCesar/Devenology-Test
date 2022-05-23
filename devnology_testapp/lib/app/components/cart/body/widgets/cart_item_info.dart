import 'package:devnology_testapp/app/controllers/app_controller.dart';
import 'package:devnology_testapp/app/database/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_fonts.dart';
import '../../../../models/cart.dart';

class CartItemInfo extends StatelessWidget {
  final Cart cartItem;
  final AppController appController;
  const CartItemInfo({
    Key? key,
    required this.cartItem,
    required this.appController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DbHelper dbHelper = DbHelper();
    appController.quantity = cartItem.itemQuantity;
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
                onTap: () async {
                  appController.decrementItemQuantity(
                    cartItem.itemQuantity,
                  );
                  cartItem.itemQuantity = appController.quantity;
                  await dbHelper.updateCart(cartItem);
                  print('decrement: ${cartItem.itemQuantity}');
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
              Observer(
                builder: (context) => Container(
                  margin: const EdgeInsets.only(left: 11),
                  child: Text(
                    appController.quantity.toString(),
                    style: AppFonts.cartNumText,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  appController.incrementItemQuantity(
                    cartItem.itemQuantity,
                  );
                  cartItem.itemQuantity = appController.quantity;
                  await dbHelper.updateCart(cartItem);
                  print('increment: ${cartItem.itemQuantity}');
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
    );
  }
}
