import 'dart:convert';

import '../../config/app_assets.dart';
import 'package:flutter/services.dart';

class HomeServices {
  static Future<Map<String, dynamic>> getLatestItemsAndBanners() async {
    final String latestBannersResponse =
        await rootBundle.loadString(AppAssets.latestBannersJson);
    final latestBannerData = json.decode(latestBannersResponse);
    final String latestItemsResponse =
        await rootBundle.loadString(AppAssets.latestItemsJson);
    final latestItemsData = json.decode(latestItemsResponse);
    return {
      'latestBannersData': latestBannerData['latest_banners'],
      'latestItemsData': latestItemsData['latest_items'],
    };
  }
}
