import 'package:devnology_testapp/app/components/checkout/appbar/checkout_appbar.dart';
import 'package:devnology_testapp/app/components/checkout/body/checkout_body.dart';
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class CheckoutView extends StatefulWidget {
  static String checkoutkey = 'CHECKOUTKEY';
  const CheckoutView({Key? key}) : super(key: key);

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CheckoutAppBar(),
      ),
      backgroundColor: AppColors.defaultWhite,
      body: CheckoutBody(),
    );
  }
}
