import 'package:mobx/mobx.dart';

import '../models/cart.dart';

part 'app_controller.g.dart';

class AppController = AppControllerBase with _$AppController;

abstract class AppControllerBase with Store {
  @observable
  int quantity = 1;

  @observable
  int cartListNum = 0;

  @observable
  double totalPrice = 0.0;

  @action
  double calculateTotalPrice(List<Cart> cartList) {
    for (final cart in cartList) {
      totalPrice += cart.itemPrice * cart.itemQuantity;
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
  int decrementItemQuantity(int itemQuantity) {
    itemQuantity > 0 ? quantity-- : quantity;
    itemQuantity = quantity;
    return itemQuantity;
  }
}
