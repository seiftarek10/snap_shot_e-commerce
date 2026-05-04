import 'package:hive_flutter/adapters.dart';
part 'product_entity.g.dart';

@HiveType(typeId: 1)
class ProductEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String price;
  @HiveField(5)
  final String rate;
  @HiveField(6)
  final String imageUrl;
  ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.rate,
    required this.imageUrl,
    required this.category,
    required this.description,
  });
}
