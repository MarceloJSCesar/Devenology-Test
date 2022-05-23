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

class CartBody extends StatefulWidget {
  final double totalPrice;
  final AppController appController;
  const CartBody({
    Key? key,
    required this.totalPrice,
    required this.appController,
  }) : super(key: key);

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  double calculateTotalPrice() {
    double total = 0.0;
    for (var element in widget.appController.cartItemList) {
      setState(() {
        total += element.itemPrice * element.itemQuantity;
      });
    }

    return total;
  }

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
            itemCount: widget.appController.cartItemList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  left: 25,
                  right: 25,
                ),
                child: Row(
                  children: <Widget>[
                    Observer(
                      builder: (context) => CartItemImg(
                        itemImgPath:
                            widget.appController.cartItemList[index].itemImg,
                      ),
                    ),
                    CartItemInfo(
                      decrement: () async {
                        setState(() async {
                          print(
                              'decr1st: ${widget.appController.cartItemList[index].itemQuantity}');
                          if (widget.appController.cartItemList[index]
                                  .itemQuantity >
                              1) {
                            widget.appController.cartItemList[index]
                                .itemQuantity--;
                            await DbHelper().updateCart(
                                widget.appController.cartItemList[index]);
                          }
                          print(
                              'decr2nd: ${widget.appController.cartItemList[index].itemQuantity}');
                        });
                      },
                      increment: () async {
                        setState(() async {
                          print(
                              'inc1st: ${widget.appController.cartItemList[index].itemQuantity}');
                          widget
                              .appController.cartItemList[index].itemQuantity--;
                          await DbHelper().updateCart(
                              widget.appController.cartItemList[index]);
                          print(
                              'in2nd: ${widget.appController.cartItemList[index].itemQuantity}');
                        });
                      },
                      cartItem: widget.appController.cartItemList[index],
                      appController: widget.appController,
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
                    widget.appController.cartItemList.length,
                    (index) async => await DbHelper().delete(
                        widget.appController.cartItemList[index].id as int),
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
