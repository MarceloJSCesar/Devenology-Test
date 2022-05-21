import 'package:devnology_testapp/app/components/details/appbar/details_appbar.dart';
import 'package:devnology_testapp/app/components/details/body/details_body.dart';
import 'package:devnology_testapp/app/config/app_colors.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatefulWidget {
  static String detailskey = 'DETAILSKEY';
  final String? img;
  final double? price;
  final String? label;
  final String? description;
  const DetailsView({
    Key? key,
    this.img,
    this.label,
    this.price,
    this.description,
  }) : super(key: key);

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  int sliderImgIndex = 0;
  final List<String> sliderImgList = <String>[];
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    final imgList = [
      widget.img as String,
      widget.img as String,
      widget.img as String,
    ];
    sliderImgList.addAll(imgList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultWhite,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: DetailsAppBar(),
      ),
      body: DetailsBody(
        price: widget.price as double,
        itemLabel: widget.label as String,
        description: widget.description as String,
        onPageChanged: (pageIndex) => setState(
          () {
            sliderImgIndex = pageIndex;
          },
        ),
        sliderImgList: sliderImgList,
        sliderImgIndex: sliderImgIndex,
      ),
    );
  }
}
