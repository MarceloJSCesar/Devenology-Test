import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppFonts {
  //home
  static TextStyle boldTitle = GoogleFonts.roboto(
    fontSize: 30,
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
  );
  //home/categories
  static TextStyle categoriesLabel = GoogleFonts.roboto(
    fontSize: 15,
    color: AppColors.primary,
    fontWeight: FontWeight.normal,
  );
  //home/latest
  static TextStyle latestLabel = GoogleFonts.roboto(
    fontSize: 9,
    color: AppColors.primary,
    fontWeight: FontWeight.w300,
  );
  static TextStyle latestPrice = GoogleFonts.roboto(
    fontSize: 11,
    color: AppColors.primary,
    fontWeight: FontWeight.w700,
  );
  //appview/bottomNavigator
  static TextStyle bottomnavigatorlabel = GoogleFonts.roboto(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.defaultWhite,
  );
  static TextStyle selectedBottomnavigatorlabel = GoogleFonts.roboto(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.yellowBottomNavigator,
  );
  //home/details
  static TextStyle detailsLabel = GoogleFonts.roboto(
    fontSize: 15,
    color: AppColors.primary,
    fontWeight: FontWeight.w700,
  );
  static TextStyle detailsPrice = GoogleFonts.roboto(
    fontSize: 26,
    color: AppColors.primary,
    fontWeight: FontWeight.w900,
  );
  static TextStyle detailsSubtitle = GoogleFonts.roboto(
    fontSize: 15,
    color: AppColors.defaultBlack,
    fontWeight: FontWeight.w700,
  );
  static TextStyle detailsDescription = GoogleFonts.roboto(
    fontSize: 14,
    color: AppColors.defaultBlack,
    fontWeight: FontWeight.w400,
  );
  static TextStyle detailsShare = GoogleFonts.roboto(
    fontSize: 12,
    color: AppColors.primary,
    fontWeight: FontWeight.w900,
  );
  static TextStyle detailsAddToCart = GoogleFonts.roboto(
    fontSize: 12,
    color: AppColors.defaultWhite,
    fontWeight: FontWeight.w900,
  );
  static TextStyle detailsNumQuantity = GoogleFonts.roboto(
    fontSize: 9,
    color: AppColors.defaultWhite,
    fontWeight: FontWeight.w700,
  );
  // cart
  static TextStyle cartLabel = GoogleFonts.roboto(
    fontSize: 11,
    color: AppColors.primary,
    fontWeight: FontWeight.w400,
  );
  static TextStyle cartPrice = GoogleFonts.roboto(
    fontSize: 14,
    color: AppColors.primary,
    fontWeight: FontWeight.w700,
  );
  static TextStyle cartIconText = GoogleFonts.roboto(
    fontSize: 12,
    color: AppColors.defaultWhite,
    fontWeight: FontWeight.w400,
  );
  static TextStyle cartNumText = GoogleFonts.roboto(
    fontSize: 14,
    color: AppColors.primary,
    fontWeight: FontWeight.w700,
  );
  static TextStyle cartTotalLabel = GoogleFonts.roboto(
    fontSize: 16,
    color: AppColors.defaultWhite,
    fontWeight: FontWeight.w400,
  );
  static TextStyle cartTotalPrice = GoogleFonts.roboto(
    fontSize: 24,
    color: AppColors.defaultWhite,
    fontWeight: FontWeight.w700,
  );
  // cart/checkout
  static TextStyle checkoutLabel = GoogleFonts.roboto(
    fontSize: 14,
    color: AppColors.primary,
    fontWeight: FontWeight.w400,
  );
}
