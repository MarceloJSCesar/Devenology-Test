import 'package:devnology_testapp/app/components/cart/appbar/cart_appbar.dart';
import 'package:devnology_testapp/app/components/cart/body/cart_body.dart';
import 'package:flutter/material.dart';

import '../../config/app_assets.dart';

class CartView extends StatefulWidget {
  static int cartPageIndex = 2;
  static String cartkey = 'CARTKEY';
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CartAppBar(),
      ),
      // get data throught database
      body: CartBody(
        price: 233.9,
        label:
            'Lenovo 15.6" ThinkPad P15s Gen 1 Laptop, Intel Core i7-10510U Quad-Core, 16GB DDR4 RAM, 512GB SSD, NVIDIA Quadro P520, Windows 10 Pro (20T4001VUS)',
        totalPrice: 3424.98,
        numQuantity: 1,
        itemImgPath: AppAssets.lenovoIdeapad,
        itemArrowRightImg: AppAssets.arrowRight,
      ),
    );
  }
}
