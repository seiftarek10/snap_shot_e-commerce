import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';
import 'package:snap_shot/features/home/domain/repo/home_repo.dart';

class AddToCartUseCase extends FutureUseCase<void, ProductEntity> {
  final HomeRepo _homeRepo;

  AddToCartUseCase(this._homeRepo);
  @override
  Future<Result<void>> call(ProductEntity param) async {
    return await _homeRepo.addToCart(product: param);
  }
}
