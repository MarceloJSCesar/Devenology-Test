import 'package:flutter/material.dart';

import '../../../../config/app_fonts.dart';

class DetailsItemLabel extends StatelessWidget {
  final String label;
  const DetailsItemLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      height: 72,
      margin: const EdgeInsets.only(
        top: 20,
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: AppFonts.detailsLabel,
      ),
    );
  }
}
