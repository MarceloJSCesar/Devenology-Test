import 'package:devnology_testapp/app/config/app_colors.dart';

import '../models/category.dart';
import '../config/app_assets.dart';
import 'package:flutter/material.dart';

class CategoriesDB {
  static List<Category> categories = <Category>[
    Category(
      label: 'Apparel',
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            AppColors.apparel1,
            AppColors.apparel2,
          ],
        ),
        image: DecorationImage(
          image: AssetImage(AppAssets.apparel),
        ),
      ),
    ),
    Category(
      label: 'Beauty',
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            AppColors.beauty1,
            AppColors.beauty2,
          ],
        ),
        image: DecorationImage(
          image: AssetImage(AppAssets.beauty),
        ),
      ),
    ),
    Category(
      label: 'Shoes',
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            AppColors.shoes1,
            AppColors.shoes2,
          ],
        ),
        image: DecorationImage(
          image: AssetImage(AppAssets.shoes),
        ),
      ),
    ),
    Category(
      label: 'See All',
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            AppColors.seeAll1,
            AppColors.seeAll1,
          ],
        ),
        image: DecorationImage(
          image: AssetImage(AppAssets.yellowArrowRight),
        ),
      ),
    ),
  ];
}
