import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:snap_shot/core/models/product_model.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
part 'order_model.g.dart';

@HiveType(typeId: 4)
class OrderModel {
  @HiveField(1)
  final String id;
  @HiveField(2)
  final List<ProductModel> products;
  @HiveField(3)
  final UserModel? userData;
  @HiveField(4)
  final String createdAt;
  @HiveField(5)
  final double productsCost;
  @HiveField(6)
  final double deliveryCost;
  @HiveField(7)
  final String status;
  @HiveField(8)
  final bool isPaid;

  OrderModel({
    required this.id,
    required this.products,
    required this.userData,
    required this.createdAt,
    required this.productsCost,
    required this.deliveryCost,
    required this.status,
     required this.isPaid,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] ?? '',
      products:
          (json['products'] as List<dynamic>?)
              ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      userData: UserModel.fromJson(json['userData']),
      createdAt: json['createdAt'] as String,
      productsCost: json['productsCost'],
      deliveryCost: json['deliveryCost'],
      status: json['status'],
      isPaid: json['isPaid']
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
      isPaid: order.isPaid
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
      "isPaid":isPaid
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
      isPaid: isPaid
    );
  }
}
