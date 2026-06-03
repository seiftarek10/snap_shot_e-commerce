import 'package:snap_shot/core/shared_domain_data/all_products/domain/entity/product_entity.dart';
import 'package:snap_shot/core/shared_domain_data/all_products/domain/repo/home_repo.dart';
import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';

class GetAllProductsUseCase extends FutureUseCase<List<ProductEntity>, void> {
  final ProductsRepo _productsRepo;

  GetAllProductsUseCase(this._productsRepo);
  @override
  Future<Result<List<ProductEntity>>> call(void param) async {
    return await _productsRepo.getAllProducts();
  }
}
