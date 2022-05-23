import 'package:mobx/mobx.dart';

import '../models/cart.dart';

part 'app_controller.g.dart';

class AppController = AppControllerBase with _$AppController;

abstract class AppControllerBase with Store {
  @observable
  int quantity = 1;

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
