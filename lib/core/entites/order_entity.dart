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

  static List<OrderEntity> get mockLoadingList => List.generate(
    5,
    (index) => OrderEntity(
      id: 'mock_id_$index',
      createdAt: '2026-05-18',
      productsCost: 0.0,
      deliveryCost: 0.0,
      status: 'pending',

      userData: UserEntity(
        uid: 'mock_user',
        userName: 'Loading Customer Name',
        email: 'loading_email@example.com',
        mobile: '0202003030',
        address: 'Cairo Egypt',
        password: '',
        customerId: '',
      ),

      products: List.generate(
        5, 
        (pIndex) => ProductEntity(
          id: 'mock_prod_$pIndex',
          name: 'Loading Product Title Placeholder',
          price: '0.0',
          rate: '',
          imageUrl: '',
          category: '',
          description: '',
          isFav: null,
          inCart: null,
          brand: '',
          stock: '',
          counter: null,
          // Pass any other required fields for your specific ProductEntity constructor here
        ),
      ),
    ),
  );
}
