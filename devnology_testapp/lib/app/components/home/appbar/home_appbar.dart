import 'package:flutter/material.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: .0,
      toolbarHeight: 60,
      centerTitle: false,
      title: const Image(
        width: 170,
        height: 26.97,
        image: AssetImage(AppAssets.logo),
      ),
      actions: <Widget>[
        GestureDetector(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.only(right: 30.49),
            child: Image(
              width: 17,
              height: 20,
              image: AssetImage(AppAssets.comment),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Image(
              width: 17,
              height: 20,
              image: AssetImage(AppAssets.notification),
            ),
          ),
        ),
      ],
      backgroundColor: AppColors.primary,
    );
  }
}
