import 'package:devnology_testapp/app/components/cart/body/widgets/cart_img_item.dart';
import 'package:devnology_testapp/app/components/cart/body/widgets/cart_item_checkout_button.dart';
import 'package:devnology_testapp/app/components/cart/body/widgets/cart_item_info.dart';
import 'package:devnology_testapp/app/components/cart/body/widgets/cart_item_total_info.dart';
import 'package:devnology_testapp/app/config/app_assets.dart';
import 'package:devnology_testapp/app/models/cart.dart';
import 'package:devnology_testapp/app/views/checkout/checkout_view.dart';
import 'package:flutter/material.dart';

import '../../../config/app_colors.dart';
import '../../bold_title.dart';

class CartBody extends StatelessWidget {
  final List<Cart> cartList;
  const CartBody({
    Key? key,
    required this.cartList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // for testing
    double calculateTotalPrice() {
      double totalPrice = 0;
      for (final cart in cartList) {
        totalPrice += cart.itemPrice * cart.itemQuantity;
      }
      return totalPrice;
    }

    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const BoldTitle(
                  title: 'Cart',
                  marginTop: 30,
                  marginBottom: 20,
                ),
                // card item, this builder list according to items added into cart
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: cartList.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: <Widget>[
                          CartItemImg(
                            itemImgPath: cartList[index].itemImg,
                          ),
                          CartItemInfo(
                            label: cartList[index].itemLabel,
                            price: cartList[index].itemPrice,
                            numQuantity: cartList[index].itemQuantity,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: <Widget>[
              Expanded(child: Container()),
              Container(
                height: 86,
                color: AppColors.secondary,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CartItemTotalInfo(total: calculateTotalPrice()),
                    CartItemCheckoutButton(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(CheckoutView.checkoutkey);
                      },
                      itemArrowRightImg: AppAssets.arrowRight,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
