import 'package:devnology_testapp/app/config/app_colors.dart';
import 'package:devnology_testapp/app/config/app_fonts.dart';
import 'package:flutter/material.dart';

class LatestComponent extends StatelessWidget {
  final int index;
  final double price;
  final String label;
  final String imgPath;
  final double imgWidth;
  final double imgHeight;
  final double cardWidth;
  final double paddingTop;
  final double cardHeight;
  final double marginLeft;
  const LatestComponent({
    Key? key,
    required this.price,
    required this.label,
    required this.index,
    required this.imgPath,
    required this.imgWidth,
    required this.imgHeight,
    required this.cardWidth,
    required this.paddingTop,
    required this.cardHeight,
    required this.marginLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        color: AppColors.defaultWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(
        top: 0,
        left: index == 0 ? 0.0 : marginLeft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 11,
              top: paddingTop,
              bottom: imgHeight < 80 ? 15.17 : 2,
            ),
            alignment: Alignment.center,
            child: Image(
              width: imgWidth,
              height: imgHeight,
              image: AssetImage(imgPath),
            ),
          ),
          // Expanded(child: Container()),
          Container(
            width: 85,
            height: 22,
            margin: const EdgeInsets.only(left: 8, right: 6),
            child: Text(
              label,
              overflow: TextOverflow.fade,
              style: AppFonts.latestLabel,
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 6),
            child: Text(
              '\$ $price',
              style: AppFonts.latestPrice,
            ),
          ),
        ],
      ),
    );
  }
}
