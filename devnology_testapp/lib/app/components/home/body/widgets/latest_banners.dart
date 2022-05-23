import 'package:flutter/material.dart';
import '../../../../config/app_assets.dart';
import '../../../../models/banner.dart';

class LatestBanners extends StatelessWidget {
  final Banner banner;
  final List<Banner> latestBanners;
  const LatestBanners({
    Key? key,
    required this.banner,
    required this.latestBanners,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: banner,
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
