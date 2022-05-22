import 'package:mobx/mobx.dart';

import '../models/cart.dart';

part 'app_controller.g.dart';

class AppController = AppControllerBase with _$AppController;

abstract class AppControllerBase with Store {
  @observable
  double totalPrice = 0.0;

  @observable
  int quantity = 1;

  @action
  double calculatingTotalPriceDecrementing(List<Cart> cartList) {
    for (final cart in cartList) {
      totalPrice = (totalPrice - cart.itemPrice) * cart.itemQuantity;
    }
    return totalPrice;
  }

  @action
  double calculatingTotalPriceIncrementing(List<Cart> cartList) {
    for (final cart in cartList) {
      totalPrice = (totalPrice + cart.itemPrice) * cart.itemQuantity;
    }
    return totalPrice;
  }

  @action
  int incrementItemQuantity(
    int itemQuantity,
  ) {
    quantity++;
    itemQuantity = quantity;
    return itemQuantity;
  }

  @action
  int decrementItemQuantity(
    int itemQuantity,
  ) {
    itemQuantity > 0 ? quantity-- : quantity;
    itemQuantity = quantity;
    return itemQuantity;
  }
}
