class LatestItem {
  late int id;
  late String img;
  late String label;
  late double price;
  late double cardWidth;
  late double paddingTop;
  late double marginLeft;
  late double cardHeight;
  late String description;

  LatestItem({
    required this.id,
    required this.img,
    required this.label,
    required this.price,
    required this.cardWidth,
    required this.paddingTop,
    required this.marginLeft,
    required this.cardHeight,
    required this.description,
  });

  LatestItem.fromMap(Map map) {
    id = map['id'];
    img = map['img'];
    label = map['label'];
    price = map['price'];
    cardWidth = map['cardWidth'];
    paddingTop = map['paddingTop'];
    marginLeft = map['marginLeft'];
    cardHeight = map['cardHeight'];
    description = map['description'];
  }
}
