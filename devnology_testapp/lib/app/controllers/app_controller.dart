import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = AppControllerBase with _$AppController;

abstract class AppControllerBase with Store {
  @observable
  int quantity = 1;

  @observable
  int cartListNum = 0;

  @action
  int incrementItemQuantity(int itemQuantity) {
    quantity++;
    itemQuantity = quantity;
    return itemQuantity;
  }

  @action
  int decrementItemQuantity(int itemQuantity) {
    quantity--;
    itemQuantity = quantity;
    return itemQuantity;
  }
}
