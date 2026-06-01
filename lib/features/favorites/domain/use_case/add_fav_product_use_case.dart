import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/favorites/domain/repos/favorites_repo.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';

class AddFavProductUseCase extends FutureUseCase<void, ProductEntity> {
  final FavoritesRepo _favRepo;

  const AddFavProductUseCase(this._favRepo);
  @override
  Future<Result<void>> call(ProductEntity param) async {
    return await _favRepo.addFavoriteProduct(product: param);
  }
}
