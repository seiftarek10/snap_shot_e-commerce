import 'package:snap_shot/features/home/domain/entity/product_entity.dart';
import 'package:hive_flutter/adapters.dart';
part 'product_model.g.dart';

@HiveType(typeId: 1)
class ProductModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? category;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final String? price;
  @HiveField(5)
  final String? imageUrl;
  @HiveField(6)
  final String? rate;
  @HiveField(7)
   bool? isFav;

  ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.rate,
    required this.isFav,
  });

  factory ProductModel.fromJson(Map<String, dynamic>? json) {
    return ProductModel(
      id: json?['id'].toString() ?? '',
      name: json?['title'].toString() ?? '',
      category: json?['category'].toString() ?? '',
      description: json?['description'].toString() ?? '',
      price: json?['price'].toString() ?? '0',
      imageUrl: json?['thumbnail'].toString() ?? '',
      rate: json?['rating'].toString() ?? '',
      isFav: json?['isFav'] ?? false,
    );
  }
  factory ProductModel.fromEntity(ProductEntity product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      category: product.category,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
      rate: product.rate,
      isFav: product.isFav ?? false,
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
      'isFav': isFav ?? false,
    };
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id ?? '',
      name: name ?? '',
      category: category ?? '',
      description: description ?? '',
      price: price ?? '0',
      rate: rate ?? '',
      imageUrl: imageUrl ?? '',
      isFav: isFav ?? false,
    );
  }
}
