import 'package:devnology_testapp/app/components/cart/appbar/cart_appbar.dart';
import 'package:devnology_testapp/app/database/db_helper.dart';
import 'package:flutter/material.dart';

import '../../components/cart/body/cart_body.dart';
import '../../controllers/app_controller.dart';
import '../../models/cart.dart';
import '../checkout/checkout_view.dart';

class CartView extends StatefulWidget {
  static int cartPageIndex = 2;
  static String cartkey = 'CARTKEY';
  final AppController appController;
  const CartView({
    Key? key,
    required this.appController,
  }) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  double calculateTotalPrice(List<Cart> cartItemList) {
    double totalPrice = 0.0;
    for (var element in cartItemList) {
      totalPrice += element.itemPrice * element.itemQuantity;
    }

    return totalPrice;
  }

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
                for (var item in snapshot.data) {
                  final cart = Cart.fromMap(item);
                  if (cartItemList.isEmpty) {
                    cartItemList.add(cart);
                  } else {
                    if (cartItemList.any((element) => element.id == cart.id)) {
                      null;
                    } else {
                      cartItemList.add(cart);
                    }
                  }
                }
                return CartBody(
                  totalPrice: calculateTotalPrice(cartItemList),
                  cartItemList: cartItemList,
                  increment: (cartItem) async {
                    setState(() {
                      cartItem.itemQuantity++;
                      DbHelper().updateCart(cartItem);
                    });
                  },
                  decrement: (cartItem) async {
                    setState(() {
                      if (cartItem.itemQuantity > 0) {
                        cartItem.itemQuantity--;
                        DbHelper().updateCart(cartItem);
                        if (cartItem.itemQuantity == 0) {
                          DbHelper().delete(cartItem.id);
                          widget.appController.cartItemList.removeWhere(
                              (element) => element.id == cartItem.id);
                        }
                      }
                    });
                  },
                  jumpToCheckout: () {
                    Navigator.of(context).pushNamed(CheckoutView.checkoutkey);
                    for (var cartItem in cartItemList) {
                      DbHelper().delete(cartItem.id as int);
                    }
                    widget.appController.cartItemList.clear();
                    setState(() {});
                  },
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
