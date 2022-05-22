import 'package:mobx/mobx.dart';

import '../models/cart.dart';

part 'app_controller.g.dart';

class AppController = AppControllerBase with _$AppController;

abstract class AppControllerBase with Store {
  @observable
  double totalPrice = 0.0;

  @observable
  int quantity = 1;

  @observable
  int cartListNum = 0;

  @action
  void calculateTotalPrice(List<Cart> cartList) {
    for (final cart in cartList) {
      totalPrice += cart.itemPrice * quantity;
    }
    print('totalPrice: $totalPrice');
  }

  @action
  int incrementItemQuantity(
    int itemQuantity,
    List<Cart> cartList,
  ) {
    quantity++;
    itemQuantity = quantity;
    return itemQuantity;
  }

  @action
  int decrementItemQuantity(
    int itemQuantity,
    List<Cart> cartList,
  ) {
    itemQuantity > 0 ? quantity-- : quantity;
    itemQuantity = quantity;
    return itemQuantity;
  }
}
