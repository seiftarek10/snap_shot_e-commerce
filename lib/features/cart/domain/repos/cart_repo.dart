import 'package:snap_shot/core/shared_domain_data/all_products/domain/entity/product_entity.dart';
import 'package:snap_shot/core/utils/result.dart';

abstract class CartRepo {
  Future<Result<List<ProductEntity>>> getCartProducts();
    Future<Result<void>> addToCart({required ProductEntity product});
  Future<Result<void>> removeFromCart({required String id});
}
