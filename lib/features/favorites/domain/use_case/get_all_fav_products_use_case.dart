import 'package:snap_shot/core/shared_domain_data/all_products/domain/entity/product_entity.dart';
import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/favorites/domain/repos/favorites_repo.dart';

class GetAllFavProductsUseCase
    extends FutureUseCase<List<ProductEntity>, void> {
  const GetAllFavProductsUseCase(this._favoritesRepo);
  final FavoritesRepo _favoritesRepo;

  @override
  Future<Result<List<ProductEntity>>> call(void param) async {
    return await _favoritesRepo.getAllFavoritesProudcts();
  }
}
