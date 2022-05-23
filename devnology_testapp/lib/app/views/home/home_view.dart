import 'package:devnology_testapp/app/components/home/body/home_body.dart';
import 'package:devnology_testapp/app/controllers/app_controller.dart';

import '../../config/app_colors.dart';
import '../../components/home/appbar/home_appbar.dart';

import 'package:flutter/material.dart';

import '../../services/home/home_services.dart';

class HomeView extends StatefulWidget {
  static String homekey = 'HOMEKEY';
  final AppController appController;
  const HomeView({
    Key? key,
    required this.appController,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: HomeAppBar(),
      ),
      backgroundColor: AppColors.whiteBackground,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: HomeServices.getLatestItems(),
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                if (snapshot.hasData) {
                  final List<dynamic> latestItems = snapshot.data;
                  return SingleChildScrollView(
                    child: HomeBody(
                      latestItems: latestItems,
                      appController: widget.appController,
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('NO data found'),
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
