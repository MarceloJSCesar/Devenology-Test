import 'package:flutter/material.dart';

import '../../../../views/details/details_view.dart';
import '../../latest_component.dart';

class LatestItems extends StatelessWidget {
  final List<dynamic> latestItems;
  const LatestItems({
    Key? key,
    required this.latestItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.only(top: 24.56, bottom: 23),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: latestItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DetailsView(
                  latestItem: latestItems[index],
                ),
              ),
            ),
            child: LatestComponent(
              index: index,
              label: latestItems[index]['label'] as String,
              imgPath: latestItems[index]['img'] as String,
              price: latestItems[index]['price'] as double,
              imgWidth: latestItems[index]['imgWidth'] as double,
              cardWidth: latestItems[index]['cardWidth'] as double,
              imgHeight: latestItems[index]['imgHeight'] as double,
              paddingTop: latestItems[index]['paddingTop'] as double,
              cardHeight: latestItems[index]['cardHeight'] as double,
              marginLeft: latestItems[index]['marginLeft'] as double,
            ),
          );
        },
      ),
    );
  }
}
