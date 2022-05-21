import 'package:flutter/material.dart';

import '../../../../config/app_colors.dart';

class CartItemImg extends StatelessWidget {
  final String itemImgPath;
  const CartItemImg({
    Key? key,
    required this.itemImgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.defaultWhite,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Image(
        fit: BoxFit.fill,
        image: AssetImage(itemImgPath),
      ),
    );
  }
}
