import 'package:devnology_testapp/app/components/cart/body/widgets/cart_img_item.dart';
import 'package:devnology_testapp/app/components/cart/body/widgets/cart_item_checkout_button.dart';
import 'package:devnology_testapp/app/components/cart/body/widgets/cart_item_info.dart';
import 'package:devnology_testapp/app/components/cart/body/widgets/cart_item_total_info.dart';
import 'package:devnology_testapp/app/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../database/db_helper.dart';
import '../../../views/checkout/checkout_view.dart';
import '../../bold_title.dart';

class CartBody extends StatelessWidget {
  final double totalPrice;
  final AppController appController;
  const CartBody({
    Key? key,
    required this.totalPrice,
    required this.appController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double calculateTotalPrice() {
      double total = 0;
      for (var element in appController.cartItemList) {
        total += element.itemPrice * element.itemQuantity;
      }
      return total;
    }

    return Observer(
      builder: (context) => Column(
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
              itemCount: appController.cartItemList.length,
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
                        itemImgPath: appController.cartItemList[index].itemImg,
                      ),
                      CartItemInfo(
                        cartItem: appController.cartItemList[index],
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
                  totalPrice: calculateTotalPrice(),
                ),
                CartItemCheckoutButton(
                  onTap: () {
                    Navigator.of(context).pushNamed(CheckoutView.checkoutkey);
                    List.generate(
                      appController.cartItemList.length,
                      (index) async => await DbHelper()
                          .delete(appController.cartItemList[index].id as int),
                    );
                  },
                  itemArrowRightImg: AppAssets.arrowRight,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
