import 'package:devnology_testapp/app/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../config/app_fonts.dart';

class CartItemTotalInfo extends StatelessWidget {
  final AppController appController;
  const CartItemTotalInfo({
    Key? key,
    required this.appController,
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
              Observer(
                builder: (_) => Text(
                  '\$ ${appController.totalPrice}',
                  style: AppFonts.cartTotalPrice,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
