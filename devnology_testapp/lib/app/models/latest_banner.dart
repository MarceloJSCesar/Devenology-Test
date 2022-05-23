class LatestBanner {
  late int id;
  late String img;
  late double bannerWidth;
  late double bannerHeight;

  LatestBanner({
    required this.id,
    required this.img,
    required this.bannerWidth,
    required this.bannerHeight,
  });

  factory LatestBanner.fromJson(Map<String, dynamic> json) => LatestBanner(
        id: json["id"],
        img: json["img"],
        bannerWidth: json["banner_width"],
        bannerHeight: json["banner_height"],
      );

  @override
  String toString() =>
      'latest_banner[id: $id, img: $img, bannerWidth: $bannerWidth, bannerHeight: $bannerHeight]';
}
