class Cart {
  final String itemImg;
  final int itemQuantity;
  final String itemLabel;
  final double itemPrice;

  Cart({
    required this.itemImg,
    required this.itemLabel,
    required this.itemPrice,
    required this.itemQuantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'itemImg': itemImg,
      'itemLabel': itemLabel,
      'itemPrice': itemPrice,
      'itemQuatity': itemQuantity,
    };
  }

  @override
  String toString() =>
      'cart:[itemImg: $itemImg, itemLabel: $itemLabel, itemPrice: $itemPrice, itemQuantity: $itemQuantity]';
}
