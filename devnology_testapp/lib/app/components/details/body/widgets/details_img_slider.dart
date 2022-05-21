import 'package:flutter/material.dart';

import '../../../../config/app_colors.dart';

class DetailsImgSlider extends StatelessWidget {
  final Function onPageChanged;
  final List<String> sliderImgList;
  const DetailsImgSlider({
    Key? key,
    required this.onPageChanged,
    required this.sliderImgList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        top: 10, bottom: 28,
        //left: 88,
        //right: 87,
      ),
      child: Container(
        color: AppColors.defaultWhite,
        height: 200,
        width: 200,
        child: PageView.builder(
          pageSnapping: true,
          itemCount: sliderImgList.length,
          onPageChanged: (pageIndex) => onPageChanged(pageIndex),
          itemBuilder: (context, pagePosition) {
            return SizedBox(
              width: 200,
              height: 200,
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage(sliderImgList[pagePosition]),
              ),
            );
          },
        ),
      ),
    );
  }
}
