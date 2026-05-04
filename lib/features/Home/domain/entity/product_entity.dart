class ProductEntity {
  final String id;
  final String name;
  final String category;
  final String description;
  final String price;
  final String rate;
  final String imageUrl;
  final bool? isFav;
  ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.rate,
    required this.imageUrl,
    required this.category,
    required this.description,
    required this.isFav,
  });

  ProductEntity copyWith({bool? isFav}) {
    return ProductEntity(
      id: id,
      name: name,
      isFav: isFav ?? this.isFav,
      price: price,
      rate: rate,
      imageUrl: imageUrl,
      category: category,
      description: description,
    );
  }
}
