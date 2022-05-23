import 'package:devnology_testapp/app/components/cart/body/widgets/cart_img_item.dart';
import 'package:devnology_testapp/app/components/cart/body/widgets/cart_item_checkout_button.dart';
import 'package:devnology_testapp/app/components/cart/body/widgets/cart_item_info.dart';
import 'package:devnology_testapp/app/components/cart/body/widgets/cart_item_total_info.dart';
import 'package:devnology_testapp/app/controllers/app_controller.dart';
import 'package:devnology_testapp/app/models/cart.dart';
import 'package:flutter/material.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../database/db_helper.dart';
import '../../../views/checkout/checkout_view.dart';
import '../../bold_title.dart';

class CartBody extends StatelessWidget {
  final List<Cart> cartList;
  final AppController appController;
  final double totalPrice;
  const CartBody({
    Key? key,
    required this.cartList,
    required this.totalPrice,
    required this.appController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: const BoldTitle(
            title: 'Cart',
            marginTop: 30,
            marginBottom: 20,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: cartList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  left: 25,
                  right: 25,
                ),
                child: Row(
                  children: <Widget>[
                    CartItemImg(
                      itemImgPath: cartList[index].itemImg,
                    ),
                    CartItemInfo(
                      cartList: cartList,
                      cartItem: cartList[index],
                      appController: appController,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          height: 86,
          color: AppColors.secondary,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CartItemTotalInfo(
                totalPrice: totalPrice,
              ),
              CartItemCheckoutButton(
                onTap: () {
                  Navigator.of(context).pushNamed(CheckoutView.checkoutkey);
                  List.generate(
                    cartList.length,
                    (index) async =>
                        await DbHelper().delete(cartList[index].id as int),
                  );
                },
                itemArrowRightImg: AppAssets.arrowRight,
              )
            ],
          ),
        ),
      ],
    );
  }
}
