import 'package:mobx/mobx.dart';

import '../database/db_helper.dart';
import '../models/cart.dart';

part 'app_controller.g.dart';

class AppController = AppControllerBase with _$AppController;

abstract class AppControllerBase with Store {
  @observable
  List<Cart> cartItemList = [];

  @observable
  int quantity = 1;

  @action
  void addItemToCart(Cart itemCart) {
    cartItemList.add(itemCart);
    if (itemCart.itemQuantity == 0) {
      DbHelper().delete(itemCart.id as int);
      cartItemList.remove(itemCart);
    }
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
