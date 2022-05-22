import 'package:devnology_testapp/app/components/details/body/widgets/details_bottom_button.dart';
import 'package:devnology_testapp/app/components/details/body/widgets/details_img_slider.dart';
import 'package:devnology_testapp/app/components/details/body/widgets/details_img_slider_dots.dart';
import 'package:devnology_testapp/app/components/details/body/widgets/details_item_label.dart';
import 'package:devnology_testapp/app/database/db_helper.dart';
import 'package:devnology_testapp/app/models/cart.dart';
import 'package:devnology_testapp/app/models/latest_item.dart';
import 'package:flutter/material.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_fonts.dart';
import '../../../views/cart/cart_view.dart';

class DetailsBody extends StatelessWidget {
  final int sliderImgIndex;
  final LatestItem latestItem;
  final Function onPageChanged;
  final List<String> sliderImgList;
  const DetailsBody({
    Key? key,
    required this.latestItem,
    required this.onPageChanged,
    required this.sliderImgList,
    required this.sliderImgIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // create for a while
    int itemQuantity = 0;
    final dbHelper = DbHelper();
    return Column(
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 22,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DetailsItemLabel(label: latestItem.label),
                  DetailsImgSlider(
                    onPageChanged: (pageIndex) => onPageChanged(pageIndex),
                    sliderImgList: sliderImgList,
                  ),
                  DetailsImgSliderDots(
                    sliderImgList: sliderImgList,
                    sliderImgIndex: sliderImgIndex,
                  ),
                  Text(
                    'Price:',
                    style: AppFonts.detailsLabel,
                  ),
                  Text(
                    '\$ ${latestItem.price}',
                    style: AppFonts.detailsPrice,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 16,
                      bottom: 10,
                    ),
                    child: Text(
                      'About this item:',
                      style: AppFonts.detailsSubtitle,
                    ),
                  ),
                  SizedBox(
                    width: 333,
                    height: 144,
                    child: Text(
                      latestItem.description,
                      style: AppFonts.detailsDescription,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Expanded(child: Container()),
              Container(
                height: 84,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                  vertical: 23,
                  horizontal: 20,
                ),
                color: AppColors.secondary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    DetailsBottomButton(
                      color: AppColors.defaultWhite,
                      label: 'SHARE THIS',
                      onTap: () {},
                      assetImg: AppAssets.arrowUp,
                      textStyle: AppFonts.detailsShare,
                    ),
                    DetailsBottomButton(
                      color: AppColors.primary,
                      label: 'ADD TO CART',
                      onTap: () async {
                        final cart = Cart(
                          id: latestItem.id,
                          itemImg: latestItem.img,
                          itemLabel: latestItem.label,
                          itemPrice: latestItem.price,
                          itemQuantity: itemQuantity + 1,
                        );
                        Navigator.of(context).pushNamed(CartView.cartkey);
                        await dbHelper.addItemToCart(cart);
                      },
                      assetImg: AppAssets.arrowRight,
                      textStyle: AppFonts.detailsAddToCart,
                    ),
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
