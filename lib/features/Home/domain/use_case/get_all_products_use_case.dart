import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';
import 'package:snap_shot/features/home/domain/repo/home_repo.dart';

class GetAllProductsUseCase extends FutureUseCase<List<ProductEntity>, void> {
  final HomeRepo _homeRepo;

  GetAllProductsUseCase(this._homeRepo);
  @override
  Future<Result<List<ProductEntity>>> call(void param) async {
    return await _homeRepo.getAllProducts();
  }
}
