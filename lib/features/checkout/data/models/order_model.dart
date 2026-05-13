import 'package:intl/intl.dart';
import 'package:snap_shot/core/models/product_model.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/checkout/domain/entity/order_entity.dart';

class OrderModel {
  final String id;
  final List<ProductModel> products;
  final UserModel? userData;
  final String createdAt;
  final double productsCost;
  final double deliveryCost;
  final String status;

  OrderModel({
    required this.id,
    required this.products,
    required this.userData,
    required this.createdAt,
    required this.productsCost,
    required this.deliveryCost,
    required this.status,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] ?? '',
      products: json['products'],
      userData: UserModel.fromJson(json['userData']),
      createdAt: json['createdAt'] as String,
      productsCost: json['productsCost'],
      deliveryCost: json['deliveryCost'],
      status: json['status'],
    );
  }

  factory OrderModel.fromEntity(OrderEntity order) {
    return OrderModel(
      id: order.id ?? '',
      products: order.products.map((e) => ProductModel.fromEntity(e)).toList(),
      userData: UserModel.fromEntity(order.userData!),
      createdAt: order.createdAt ?? DateFormat.yMd().format(DateTime.now()),
      productsCost: order.productsCost,
      deliveryCost: order.deliveryCost,
      status: order.status,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "products": products.map((product) => product.toJson()).toList(),
      "userData": userData!.toJson(),
      "createdAt": DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
      "productsCost": productsCost,
      "deliveryCost": deliveryCost,
      "status": status,
    };
  }

  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      userData: userData!.toUSerEntity(),
      products: products.map((e) => e.toEntity()).toList(),
      createdAt: createdAt,
      deliveryCost: deliveryCost,
      productsCost: productsCost,
      status: status,
    );
  }
}
