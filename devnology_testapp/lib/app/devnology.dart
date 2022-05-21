import 'package:devnology_testapp/app/views/app_view.dart';
import 'package:devnology_testapp/app/views/cart/cart_view.dart';
import 'package:devnology_testapp/app/views/checkout/checkout_view.dart';
import 'package:devnology_testapp/app/views/details/details_view.dart';
import 'package:devnology_testapp/app/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Devnology extends StatelessWidget {
  const Devnology({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppView.appKey,
      routes: {
        AppView.appKey: (_) => const AppView(),
        HomeView.homekey: (_) => const HomeView(),
        CartView.cartkey: (_) => const CartView(),
        DetailsView.detailskey: (_) => const DetailsView(),
        CheckoutView.checkoutkey: (_) => const CheckoutView(),
      },
    );
  }
}
