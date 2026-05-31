import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';

abstract class CartRepo {
  Future<Result<List<ProductEntity>>> getCartProducts();
}
