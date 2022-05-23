import 'package:devnology_testapp/app/components/details/appbar/details_appbar.dart';
import 'package:devnology_testapp/app/components/details/body/details_body.dart';
import 'package:devnology_testapp/app/config/app_colors.dart';
import 'package:devnology_testapp/app/controllers/app_controller.dart';
import 'package:devnology_testapp/app/models/latest_item.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatefulWidget {
  static String detailskey = 'DETAILSKEY';
  final LatestItem? latestItem;
  final AppController appController;
  const DetailsView({
    Key? key,
    this.latestItem,
    required this.appController,
  }) : super(key: key);

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  int sliderImgIndex = 0;
  final List<String> sliderImgList = <String>[];

  @override
  void initState() {
    super.initState();
    final imgList = [
      widget.latestItem!.img,
      widget.latestItem!.img,
      widget.latestItem!.img,
    ];
    sliderImgList.addAll(imgList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultWhite,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: DetailsAppBar(
          appController: widget.appController,
        ),
      ),
      body: DetailsBody(
        refreshState: () => setState(() {}),
        appController: widget.appController,
        latestItem: widget.latestItem as LatestItem,
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
