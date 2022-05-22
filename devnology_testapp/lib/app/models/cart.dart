import '../config/app_dbnames.dart';

class Cart {
  late int? id;
  late String itemImg;
  late int itemQuantity;
  late String itemLabel;
  late double itemPrice;

  Cart({
    required this.id,
    required this.itemImg,
    required this.itemLabel,
    required this.itemPrice,
    required this.itemQuantity,
  });

  Cart.fromMap(Map map) {
    id = map[AppDbNames.id];
    itemImg = map[AppDbNames.itemImg];
    itemLabel = map[AppDbNames.itemLabel];
    itemPrice = map[AppDbNames.itemPrice];
    itemQuantity = map[AppDbNames.itemQuantity];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      AppDbNames.itemImg: itemImg,
      AppDbNames.itemLabel: itemLabel,
      AppDbNames.itemPrice: itemPrice,
      AppDbNames.itemQuantity: itemQuantity,
    };
    if (id != null) {
      map[AppDbNames.id] = id;
    }
    return map;
  }

  @override
  String toString() =>
      'cart:[id: $id, itemImg: $itemImg, itemLabel: $itemLabel, itemPrice: $itemPrice, itemQuantity: $itemQuantity]';
}
