import 'package:meta/meta.dart';
import 'package:snap_shot/core/bloc/base_cubit.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/cart/domain/use_cases/get_cart_products_use_case.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';

part 'get_cart_proudcts_state.dart';

class GetCartProudctsCubit extends BaseCubit<GetCartProudctsState> {
  GetCartProudctsCubit(this._getCartProductsUseCase)
    : super(const GetCartProudctsInitial());

  final GetCartProductsUseCase _getCartProductsUseCase;

  Future<void> getCartProudcts() async {
    safeEmit(const GettingCartProudcts());
    final result = await _getCartProductsUseCase(null);
    if (result is Success<List<ProductEntity>>) {
      safeEmit(CartProudctsLoadded(result.data));
    } else if (result is AppFailure<List<ProductEntity>>) {
      safeEmit(FailedLoadCartProducts(result.failure.errMessage));
    }
  }
}
