import 'package:devnology_testapp/app/config/app_fonts.dart';
import 'package:devnology_testapp/app/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';

class DetailsAppBar extends StatelessWidget {
  final AppController appController;
  const DetailsAppBar({
    Key? key,
    required this.appController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: .0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.primary,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Image(
          width: 10.3,
          height: 18.03,
          image: AssetImage(AppAssets.arrowLeft),
        ),
      ),
      title: const Image(
        width: 170,
        height: 26.87,
        image: AssetImage(AppAssets.logo),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 21,
            top: 21,
            bottom: 21,
          ),
          child: Container(
            height: 18,
            width: 18.53,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.cart),
              ),
            ),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: const Alignment(2.5, 11),
                  child: Container(
                    width: 13,
                    height: 13,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.yellowBottomNavigator,
                    ),
                    child: Observer(
                      builder: (context) => Text(
                        appController.cartItemList.length.toString(),
                        style: AppFonts.detailsNumQuantity,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
