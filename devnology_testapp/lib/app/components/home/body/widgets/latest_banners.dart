import 'package:flutter/material.dart';

class LatestBanners extends StatelessWidget {
  final List<dynamic> latestBanners;
  const LatestBanners({
    Key? key,
    required this.latestBanners,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 181,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: latestBanners.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
              margin: latestBanners[index]['id'] == 1
                  ? null
                  : const EdgeInsets.only(left: 10),
              child: Image.asset(latestBanners[index]['banner']));
        },
      ),
    );
  }
}
