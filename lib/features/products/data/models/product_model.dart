class ProductModel {
  final String id;
  final String title;
  final int currentPrice;
  final List<String> photos;

  ProductModel({
    required this.id,
    required this.title,
    required this.currentPrice,
    required this.photos,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['_id'],
    title: json['title'],
    currentPrice: int.tryParse(json['current_price'].toString()) ?? 0,
    photos: List<String>.from(json['photos'] ?? []),
  );
}
