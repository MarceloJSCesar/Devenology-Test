import 'package:flutter/material.dart';

class DetailsImgSliderDots extends StatelessWidget {
  final int sliderImgIndex;
  final List<String> sliderImgList;
  const DetailsImgSliderDots({
    Key? key,
    required this.sliderImgList,
    required this.sliderImgIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List<Widget>.generate(
          sliderImgList.length,
          (index) {
            return Container(
              margin: const EdgeInsets.only(
                left: 10,
                bottom: 8,
              ),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: sliderImgIndex == index ? Colors.black : Colors.black26,
                shape: BoxShape.circle,
              ),
            );
          },
        ),
      ],
    );
  }
}
