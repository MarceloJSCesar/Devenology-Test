import 'package:devnology_testapp/app/components/cart/body/widgets/cart_img_item.dart';
import 'package:devnology_testapp/app/components/cart/body/widgets/cart_item_checkout_button.dart';
import 'package:devnology_testapp/app/components/cart/body/widgets/cart_item_info.dart';
import 'package:devnology_testapp/app/components/cart/body/widgets/cart_item_total_info.dart';
import 'package:devnology_testapp/app/views/checkout/checkout_view.dart';
import 'package:flutter/material.dart';

import '../../../config/app_colors.dart';
import '../../bold_title.dart';

class CartBody extends StatelessWidget {
  final double price;
  final String label;
  final int numQuantity;
  final double totalPrice;
  final String itemImgPath;
  final String itemArrowRightImg;
  const CartBody({
    Key? key,
    required this.price,
    required this.label,
    required this.totalPrice,
    required this.numQuantity,
    required this.itemImgPath,
    required this.itemArrowRightImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                SizedBox(
                  child: Row(
                    children: <Widget>[
                      CartItemImg(itemImgPath: itemImgPath),
                      CartItemInfo(
                        label: label,
                        price: price,
                        numQuantity: numQuantity,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: <Widget>[
                      CartItemImg(itemImgPath: itemImgPath),
                      CartItemInfo(
                        label: label,
                        price: price,
                        numQuantity: numQuantity,
                      ),
                    ],
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
                    CartItemTotalInfo(total: totalPrice),
                    CartItemCheckoutButton(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(CheckoutView.checkoutkey);
                      },
                      itemArrowRightImg: itemArrowRightImg,
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
