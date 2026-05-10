import 'package:snap_shot/features/home/domain/entity/product_entity.dart';
import 'package:snap_shot/features/home/presentation/manager/cart_cubit/user_cart_manager_cubit.dart';
import 'package:snap_shot/features/home/presentation/manager/get_products_cubit/get_all_products_cubit.dart';

class ProductDetailsExtraModel {
  final ProductEntity productEntity;
  final UserHomeProudctsCubit? getAllProductsCubit;
  final UserCartManegerCubit? userHomeCartCubit;
  final bool fromHomeScreen;

  ProductDetailsExtraModel({
    required this.productEntity,
     this.getAllProductsCubit,
     this.userHomeCartCubit,
    required this.fromHomeScreen
  });
}
