class ProductModel {
  int? id;
  String? name;
  String? code;
  double price;
  String? warehouse;
  String? imageUrl;
  List<Variants>? variants;
  List<Images>? images;
  int? totalCount;

  ProductModel({
    this.id,
    this.name,
    this.code,
    required this.price,
    this.warehouse,
    this.imageUrl,
    this.variants,
    this.images,
    this.totalCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      price: json['price'],
      warehouse: json['warehouse'],
      imageUrl: json['imageUrl'],
      variants: (json['variants'] as List<dynamic>?)
          ?.map((v) => Variants.fromJson(v))
          .toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((v) => Images.fromJson(v))
          .toList(),
      totalCount: json['totalCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'price': price,
      'warehouse': warehouse,
      'imageUrl': imageUrl,
      'variants': variants?.map((v) => v.toJson()).toList(),
      'images': images?.map((v) => v.toJson()).toList(),
      'totalCount': totalCount,
    };
  }
}

class Variants {
  int? id;
  String? color;
  int? quantity;
  String? arrivalDate;

  Variants({
    this.id,
    this.color,
    this.quantity,
    this.arrivalDate,
  });

  factory Variants.fromJson(Map<String, dynamic> json) {
    return Variants(
      id: json['id'],
      color: json['color'],
      quantity: json['quantity'],
      arrivalDate: json['arrivalDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'color': color,
      'quantity': quantity,
      'arrivalDate': arrivalDate,
    };
  }
}

class Images {
  int? id;
  String? imageUrl;
  String? altText;
  bool? isPrimary;

  Images({
    this.id,
    this.imageUrl,
    this.altText,
    this.isPrimary,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      id: json['id'],
      imageUrl: json['imageUrl'],
      altText: json['altText'],
      isPrimary: json['isPrimary'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'altText': altText,
      'isPrimary': isPrimary,
    };
  }
}
