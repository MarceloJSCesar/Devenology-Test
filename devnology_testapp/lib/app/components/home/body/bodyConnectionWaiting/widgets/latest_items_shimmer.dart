import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class LatestItemsShimmer extends StatelessWidget {
  const LatestItemsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.grey,
      baseColor: Colors.grey.shade300,
      child: Container(
        height: 130,
        margin: const EdgeInsets.only(top: 24.56, bottom: 23),
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              width: 101,
              height: 135,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          },
        ),
      ),
    );
  }
}
