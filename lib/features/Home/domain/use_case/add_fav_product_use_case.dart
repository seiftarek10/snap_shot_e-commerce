import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';
import 'package:snap_shot/features/home/domain/repo/home_repo.dart';

class AddFavProductUseCase extends UseCase<void, ProductEntity> {
  final HomeRepo _homeRepo;

  const AddFavProductUseCase(this._homeRepo);
  @override
  Future<Result<void>> call(ProductEntity param) async {
    return await _homeRepo.addFavoriteProduct(product: param);
  }
}
