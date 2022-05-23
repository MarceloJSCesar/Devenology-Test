import 'package:flutter/material.dart';

import '../../../../config/app_assets.dart';

class LatestBanners extends StatelessWidget {
  const LatestBanners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.44,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              Image(
                image: AssetImage(AppAssets.banner1),
              ),
              SizedBox(width: 10),
              Image(
                image: AssetImage(AppAssets.banner2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
