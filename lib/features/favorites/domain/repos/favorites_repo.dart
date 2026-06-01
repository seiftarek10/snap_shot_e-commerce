import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';

abstract class FavoritesRepo {
  Future<Result<List<ProductEntity>>> getAllFavoritesProudcts();
  Future<Result<void>> addFavoriteProduct({required ProductEntity product});
  Future<Result<void>> removeFavProduct({required String id});
}
