import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';

class OrderEntity {
  final String? id;
  final UserEntity? userData;
  final List<ProductEntity> products;
  final String? createdAt;
  final double productsCost;
  final double deliveryCost;
  final String status;

  OrderEntity({
    this.id,
    required this.userData,
    required this.products,
    this.createdAt,
    required this.productsCost,
    required this.deliveryCost,
    this.status = 'pending',
  });

  OrderEntity copyWith({
    String? id,
    UserEntity? userData,
    List<ProductEntity>? products,
    String? createdAt,
    double? productsCost,
    double? deliveryCost,
    String? status,
  }) {
    return OrderEntity(
      id: id ?? this.id,
      userData: userData ?? this.userData,
      products: products ?? this.products,
      createdAt: createdAt ?? this.createdAt,
      productsCost: productsCost ?? this.productsCost,
      deliveryCost: deliveryCost ?? this.deliveryCost,
      status: status ?? this.status,
    );
  }
}
