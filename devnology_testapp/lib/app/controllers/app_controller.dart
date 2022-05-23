import 'package:mobx/mobx.dart';

import '../models/cart.dart';

part 'app_controller.g.dart';

class AppController = AppControllerBase with _$AppController;

abstract class AppControllerBase with Store {
  @observable
  List<Cart> cartItemList = [];

  @action
  void addCartToItemList(Cart cart) {
    if (cartItemList.isEmpty) {
      cartItemList.add(cart);
    } else {
      if (cartItemList.any((element) => element.id == cart.id)) {
        null;
      } else {
        cartItemList.add(cart);
      }
    }
  }
}
