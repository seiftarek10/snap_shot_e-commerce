import 'package:snap_shot/features/home/domain/entity/product_entity.dart';
import 'package:snap_shot/features/home/presentation/manager/cart_cubit/user_home_cart_cubit.dart';
import 'package:snap_shot/features/home/presentation/manager/get_products_cubit/get_all_products_cubit.dart';

class ProductDetailsExtraModel {
  final ProductEntity productEntity;
  final GetAllProductsCubit getAllProductsCubit;
  final UserHomeCartCubit userHomeCartCubit;

  ProductDetailsExtraModel({
    required this.productEntity,
    required this.getAllProductsCubit,
    required this.userHomeCartCubit,
  });
}
