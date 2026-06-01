import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/cart/domain/repos/cart_repo.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';

class AddToCartUseCase extends FutureUseCase<void, ProductEntity> {
  final CartRepo _cartRepo;

  AddToCartUseCase(this._cartRepo);
  @override
  Future<Result<void>> call(ProductEntity param) async {
    return await _cartRepo.addToCart(product: param);
  }
}
