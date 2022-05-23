import 'package:devnology_testapp/app/controllers/app_controller.dart';
import 'package:devnology_testapp/app/database/db_helper.dart';
import 'package:devnology_testapp/app/models/cart.dart';
import 'package:devnology_testapp/app/views/app_view.dart';
import 'package:devnology_testapp/app/views/cart/cart_view.dart';
import 'package:devnology_testapp/app/views/checkout/checkout_view.dart';
import 'package:devnology_testapp/app/views/details/details_view.dart';
import 'package:devnology_testapp/app/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Devnology extends StatefulWidget {
  const Devnology({Key? key}) : super(key: key);

  @override
  State<Devnology> createState() => _DevnologyState();
}

class _DevnologyState extends State<Devnology> {
  AppController appController = AppController();
  @override
  void initState() {
    super.initState();

    setState(() {
      DbHelper().getAllItems().then((value) => value
          .map((e) => appController.addCartToItemList(Cart.fromMap(e)))
          .toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    DbHelper().getAllItems().then((value) => value
        .map((e) => appController.addCartToItemList(Cart.fromMap(e)))
        .toList());
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
        AppView.appKey: (_) => AppView(
              appController: appController,
            ),
        HomeView.homekey: (_) => HomeView(appController: appController),
        CartView.cartkey: (_) => CartView(
              appController: appController,
            ),
        DetailsView.detailskey: (_) => DetailsView(
              appController: appController,
            ),
        CheckoutView.checkoutkey: (_) => const CheckoutView(),
      },
    );
  }
}
