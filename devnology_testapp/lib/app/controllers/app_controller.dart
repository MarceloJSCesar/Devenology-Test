import 'package:mobx/mobx.dart';

import '../database/db_helper.dart';
import '../models/cart.dart';

part 'app_controller.g.dart';

class AppController = AppControllerBase with _$AppController;

abstract class AppControllerBase with Store {
  @observable
  List<Cart> cartItemList = [];

  @action
  void initCartViewState(Cart cart) {
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

  @action
  void addItemToCart(Cart itemCart) {
    if (cartItemList.isNotEmpty) {
      for (Cart cart in cartItemList) {
        if (cart.id == itemCart.id) {
          cart.itemQuantity += itemCart.itemQuantity;
          DbHelper().updateCart(cart);
          return;
        } else {
          cartItemList.add(itemCart);
          DbHelper().addItemToCart(cart);
          return;
        }
      }
    } else {
      cartItemList.add(itemCart);
      DbHelper().addItemToCart(itemCart);
    }
  }
}
