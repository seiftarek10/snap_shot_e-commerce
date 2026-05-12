class ProductEntity {
  final String id;
  final String name;
  final String category;
  final String description;
  final String price;
  final String rate;
  final String imageUrl;
  final bool? isFav;
  final bool? inCart;
  final String brand;
  final String stock;
  final int? counter;
  ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.rate,
    required this.imageUrl,
    required this.category,
    required this.description,
    required this.isFav,
    required this.inCart,
    required this.brand,
    required this.stock,
    required this.counter,
  });

  ProductEntity copyWith({bool? isFav, bool? inCart,int?counter}) {
    return ProductEntity(
      id: id,
      name: name,
      isFav: isFav ?? this.isFav,
      price: price,
      rate: rate,
      imageUrl: imageUrl,
      category: category,
      description: description,
      inCart: inCart ?? this.inCart,
      brand: brand,
      stock: stock,
      counter: counter??1,
    );
  }
}
