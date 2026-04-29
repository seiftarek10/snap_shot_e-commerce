import 'package:meta/meta.dart';
import 'package:snap_shot/core/bloc/base_cubit.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';
import 'package:snap_shot/features/home/domain/use_case/get_all_products_use_case.dart';

part 'get_all_products_state.dart';

class GetAllProductsCubit extends BaseCubit<GetAllProductsState> {
  GetAllProductsCubit(this._getAllProductsUseCase)
    : super(GetAllProductsInitial());

  final GetAllProductsUseCase _getAllProductsUseCase;

  Future<void> getAllProducts() async {
    safeEmit(Loading());
    final response = await _getAllProductsUseCase.call(null);
    if (response is Success<List<ProductEntity>>) {
      safeEmit(GetProductsSuccess(response.data));
    }
    if (response is AppFailure<List<ProductEntity>>) {
      safeEmit(GetProductsFailure(response.failure.errMessage));
    }
  }
}
