import 'package:snap_shot/core/shared_domain_data/all_products/domain/entity/product_entity.dart';
import 'package:snap_shot/core/utils/result.dart';

abstract class ProductsRepo {
  Future<Result<List<ProductEntity>>> getAllProducts();


}
