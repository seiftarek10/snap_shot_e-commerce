import 'package:snap_shot/features/home/domain/entity/product_entity.dart';

class ProductModel {
  final String id;
  final String name;
  final String category;
  final String description;
  final double price;
  final String imageUrl;
  final String rate;

  ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.rate,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      name: json['title'].toString(),
      category: json['category'].toString(),
      description: json['description'].toString(),
      price: (json['price'] as num).toDouble(),
      imageUrl: json['thumbnail'].toString(),
      rate: json['rating'].toString(),
    );
  }

  toJson() {
    return {
      'id': id,
      'title': name,
      'category': category,
      'description': description,
      'price': price,
      'thumbnail': imageUrl,
      'rating': rate,
    };
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      category: category,
      description: description,
      price: price.toString(),
      rate: rate,
      imageUrl: imageUrl,
    );
  }
}
