class ProductEntity {
  final String id;
  final String name;
  final String category;
  final String description;
  final String price;
  final String rate;
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
