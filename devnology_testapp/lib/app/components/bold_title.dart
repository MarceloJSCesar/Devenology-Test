import 'package:devnology_testapp/app/config/app_fonts.dart';
import 'package:flutter/material.dart';

class BoldTitle extends StatelessWidget {
  final String title;
  final double marginTop;
  final double marginBottom;
  const BoldTitle({
    Key? key,
    required this.title,
    required this.marginTop,
    required this.marginBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, marginTop, 0, marginBottom),
      child: Text(
        title,
        style: AppFonts.boldTitle,
      ),
    );
  }
}
