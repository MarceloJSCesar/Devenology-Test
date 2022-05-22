import 'dart:convert';

import '../../config/app_assets.dart';
import 'package:flutter/services.dart';

class HomeServices {
  static Future getLatestItems() async {
    final String response =
        await rootBundle.loadString(AppAssets.latestItemsJson);
    final data = json.decode(response);
    return data['latest_items'];
  }
}
