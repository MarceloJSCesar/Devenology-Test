import 'dart:io';

import 'package:devnology_testapp/app/config/app_fonts.dart';

import 'home/home_view.dart';
import '../config/app_colors.dart';
import '../views/cart/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppView extends StatefulWidget {
  static String appKey = 'APPKEY';
  const AppView({Key? key}) : super(key: key);

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
      const HomeView(),
      Container(),
      const CartView(),
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
              children: [
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
              children: [
                const Icon(
                  CupertinoIcons.cart,
                  size: 32,
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
