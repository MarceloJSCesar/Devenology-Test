import 'package:devnology_testapp/app/models/latest_banner.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class LatestBannersShimmer extends StatelessWidget {
  const LatestBannersShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<LatestBanner> latestBanners = [
      LatestBanner(
        id: 1,
        img: '',
        bannerWidth: 325,
        bannerHeight: 180.44,
      ),
      LatestBanner(
        id: 2,
        img: '',
        bannerWidth: 325,
        bannerHeight: 180.93,
      ),
    ];
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey,
      child: SizedBox(
          height: 181,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: latestBanners.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                  margin: latestBanners[index].id == 1
                      ? null
                      : const EdgeInsets.only(left: 10),
                  child: Container(
                    width: latestBanners[index].bannerWidth,
                    height: latestBanners[index].bannerHeight,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ));
            },
          )),
    );
  }
}
