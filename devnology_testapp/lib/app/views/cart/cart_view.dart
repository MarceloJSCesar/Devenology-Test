import 'package:devnology_testapp/app/components/cart/appbar/cart_appbar.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CartAppBar(),
      ),
      // get data throught database
      body: FutureBuilder(
        future: DbHelper().getAllItems(),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasData && snapshot.data.length > 0) {
                List<Cart> cartItemList = [];
                for (var itemCart in snapshot.data) {
                  cartItemList.add(Cart.fromMap(itemCart));
                }
                return CartBody(
                  cartList: cartItemList,
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
