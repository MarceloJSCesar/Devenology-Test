import '../../config/app_fonts.dart';
import 'package:flutter/material.dart';

class CategoryComponent extends StatelessWidget {
  final int index;
  final String label;
  final double marginLeft;
  final Decoration decoration;
  const CategoryComponent({
    Key? key,
    required this.index,
    required this.label,
    required this.marginLeft,
    required this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 12,
        left: index == 0 ? 0.0 : marginLeft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: decoration,
          ),
          const SizedBox(height: 8),
          SizedBox(
            child: Text(
              label,
              style: AppFonts.categoriesLabel,
            ),
          ),
        ],
      ),
    );
  }
}
