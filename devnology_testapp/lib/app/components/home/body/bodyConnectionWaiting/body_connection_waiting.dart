import 'package:devnology_testapp/app/components/home/body/bodyConnectionWaiting/widgets/latest_banners_shimmer.dart';
import 'package:flutter/material.dart';

import '../../../bold_title.dart';
import '../widgets/categories_items.dart';
import '../widgets/latest_banners.dart';
import '../widgets/latest_items.dart';

class BodyConnectionWaiting extends StatelessWidget {
  const BodyConnectionWaiting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const <Widget>[
          BoldTitle(
            title: 'Categories',
            marginTop: 30,
            marginBottom: 12,
          ),
          CategoriesItems(),
          BoldTitle(
            title: 'Latest',
            marginTop: 22,
            marginBottom: 10,
          ),
          LatestBannersShimmer(),
          // latestItems shimmer
        ],
      ),
    );
  }
}
