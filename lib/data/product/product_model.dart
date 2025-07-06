import 'package:main/data/product/varinat.dart';

class ProductModel {
  final int id;
  final String name;
  final String code;
  final double price;
  final String warehouse;
  final String? imageUrl;
  final List<Variant> variants;
  final List<dynamic?> images;
  final int totalCount;

  ProductModel({
    required this.id,
    required this.name,
    required this.code,
    required this.price,
    required this.warehouse,
    required this.imageUrl,
    required this.variants,
    required this.images,
    required this.totalCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      price: (json['price'] as num).toDouble(),
      warehouse: json['warehouse'] ?? '',
      imageUrl: json['imageUrl'],
      variants:
          (json['variants'] as List<dynamic>)
              .map((e) => Variant.fromJson(e))
              .toList(),
      images: json['images'] ?? [],
      totalCount: json['totalCount'] ?? 0,
    );
  }
}
