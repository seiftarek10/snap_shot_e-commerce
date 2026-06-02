import 'package:snap_shot/core/shared_domain_data/all_products/domain/entity/product_entity.dart';
import 'package:snap_shot/core/utils/result.dart';

abstract class FavoritesRepo {
  Future<Result<List<ProductEntity>>> getAllFavoritesProudcts();
  Future<Result<void>> addFavoriteProduct({required ProductEntity product});
  Future<Result<void>> removeFavProduct({required String id});
}
