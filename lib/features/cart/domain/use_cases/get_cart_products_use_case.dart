import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/cart/domain/repos/cart_repo.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';

class GetCartProductsUseCase extends UseCase<List<ProductEntity>, void> {
  final CartRepo _cartRepo;

  const GetCartProductsUseCase(this._cartRepo);
  @override
  Future<Result<List<ProductEntity>>> call(void param) async {
    return await _cartRepo.getCartProducts();
  }
}
