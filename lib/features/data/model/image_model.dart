class ImageModel {
  final String id;
  final String url;
  final int width;
  final int height;

  ImageModel(
      {required this.id,
      required this.url,
      required this.width,
      required this.height});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json["id"],
      url: json["url"],
      width: json["width"],
      height: json["height"]);
  }
}
