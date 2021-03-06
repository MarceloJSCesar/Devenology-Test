import 'package:devnology_testapp/app/components/home/body/widgets/categories_items.dart';
import 'package:devnology_testapp/app/components/home/body/widgets/latest_banners.dart';
import 'package:devnology_testapp/app/components/home/body/widgets/latest_items.dart';
import 'package:devnology_testapp/app/controllers/app_controller.dart';
import 'package:flutter/material.dart';

import '../../bold_title.dart';

class HomeBody extends StatelessWidget {
  final List<dynamic> latestItems;
  final List<dynamic> latestBanners;
  final AppController appController;
  const HomeBody({
    Key? key,
    required this.latestItems,
    required this.appController,
    required this.latestBanners,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const BoldTitle(
            title: 'Categories',
            marginTop: 30,
            marginBottom: 12,
          ),
          const CategoriesItems(),
          const BoldTitle(
            title: 'Latest',
            marginTop: 22,
            marginBottom: 10,
          ),
          LatestBanners(
            latestBanners: latestBanners,
          ),
          LatestItems(
            latestItems: latestItems,
            appController: appController,
          ),
        ],
      ),
    );
  }
}
