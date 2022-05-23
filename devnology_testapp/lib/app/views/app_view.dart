import 'dart:io';

import 'package:devnology_testapp/app/config/app_fonts.dart';
import 'package:devnology_testapp/app/controllers/app_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'home/home_view.dart';
import '../config/app_colors.dart';
import '../views/cart/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppView extends StatefulWidget {
  static String appKey = 'APPKEY';
  final AppController appController;
  const AppView({
    Key? key,
    required this.appController,
  }) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  List<Widget>? _pages;
  int selectPageIndex = 0;
  PageController? _pageController;
  String defaultLocale = Platform.localeName;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeView(
        appController: widget.appController,
      ),
      Container(),
      CartView(
        appController: widget.appController,
      ),
      Container(),
      Container(),
      Container(),
    ];

    _pageController = PageController(
      initialPage: selectPageIndex,
    );
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages as List<Widget>,
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                const Icon(
                  Icons.home_outlined,
                  size: 32,
                ),
                Text(
                  'Home',
                  style: selectPageIndex == 0
                      ? AppFonts.selectedBottomnavigatorlabel
                      : AppFonts.bottomnavigatorlabel,
                ),
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: <Widget>[
                const Icon(
                  CupertinoIcons.search,
                  size: 32,
                ),
                Text(
                  'Search',
                  style: selectPageIndex == 1
                      ? AppFonts.selectedBottomnavigatorlabel
                      : AppFonts.bottomnavigatorlabel,
                ),
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: const Icon(
                        CupertinoIcons.cart,
                        size: 32,
                      ),
                    ),
                    Positioned(
                      top: 17,
                      left: 45,
                      child: Container(
                        width: 13,
                        height: 13,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.yellowBottomNavigator,
                        ),
                        child: Observer(
                          builder: (context) => Text(
                            widget.appController.cartItemList.length.toString(),
                            style: AppFonts.detailsNumQuantity,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Cart',
                  style: selectPageIndex == 2
                      ? AppFonts.selectedBottomnavigatorlabel
                      : AppFonts.bottomnavigatorlabel,
                ),
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                const Icon(
                  CupertinoIcons.person,
                  size: 32,
                ),
                Text(
                  'Profile',
                  style: selectPageIndex == 3
                      ? AppFonts.selectedBottomnavigatorlabel
                      : AppFonts.bottomnavigatorlabel,
                ),
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                const Icon(
                  Icons.menu,
                  size: 32,
                ),
                Text(
                  'Menu',
                  style: selectPageIndex == 4
                      ? AppFonts.selectedBottomnavigatorlabel
                      : AppFonts.bottomnavigatorlabel,
                ),
              ],
            ),
          ),
        ],
        activeColor: AppColors.yellowBottomNavigator,
        inactiveColor: AppColors.defaultWhite,
        currentIndex: selectPageIndex,
        backgroundColor: AppColors.primary,
        onTap: (selectedPageIndex) {
          setState(() {
            selectPageIndex = selectedPageIndex;
            _pageController!.jumpToPage(selectedPageIndex);
          });
        },
      ),
    );
  }
}
