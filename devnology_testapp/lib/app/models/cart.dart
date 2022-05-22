class Cart {
  final int id;
  final String itemImg;
  final int itemQuantity;
  final String itemLabel;
  final double itemPrice;

  Cart({
    required this.id,
    required this.itemImg,
    required this.itemLabel,
    required this.itemPrice,
    required this.itemQuantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'itemImg': itemImg,
      'itemLabel': itemLabel,
      'itemPrice': itemPrice,
      'itemQuatity': itemQuantity,
    };
  }

  @override
  String toString() =>
      'cart:[id: $id, itemImg: $itemImg, itemLabel: $itemLabel, itemPrice: $itemPrice, itemQuantity: $itemQuantity]';
}
