import 'package:devnology_testapp/app/components/cart/appbar/cart_appbar.dart';
import 'package:devnology_testapp/app/controllers/app_controller.dart';
import 'package:devnology_testapp/app/database/db_helper.dart';
import 'package:devnology_testapp/app/models/cart.dart';
import 'package:flutter/material.dart';

import '../../components/cart/body/cart_body.dart';

class CartView extends StatefulWidget {
  static int cartPageIndex = 2;
  static String cartkey = 'CARTKEY';
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  double totalPrice = 0.0;
  AppController appController = AppController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CartAppBar(),
      ),
      // get data throught database
      body: StreamBuilder(
        stream: DbHelper().getAllItems().asStream(),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasData && snapshot.data.length > 0) {
                for (var itemCart in snapshot.data) {
                  if (appController.cartItemList.contains(itemCart)) {
                    print('itemCart is already in the list');
                  } else {
                    appController.addItemToCart(Cart.fromMap(itemCart));
                  }
                }

                return CartBody(
                  appController: appController,
                  totalPrice: totalPrice,
                );
              } else {
                return const Center(
                  child: Text('No data in cart was found'),
                );
              }
          }
        },
      ),
    );
  }
}
