import 'package:meta/meta.dart';
import 'package:snap_shot/core/bloc/base_cubit.dart';
import 'package:snap_shot/core/shared_domain_data/all_products/domain/entity/product_entity.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/cart/domain/use_cases/get_cart_products_use_case.dart';

part 'get_cart_proudcts_state.dart';

class GetCartProudctsCubit extends BaseCubit<GetCartProudctsState> {
  GetCartProudctsCubit(this._getCartProductsUseCase)
    : super(const GetCartProudctsInitial());

  final GetCartProductsUseCase _getCartProductsUseCase;
  List<ProductEntity> prodcuts = [];
  double productsCost = 0.0;
  double delivery = 0.0;
  Future<List<ProductEntity>> getCartProudcts() async {
    prodcuts = [];
    safeEmit(const GettingCartProudcts());
    final result = await _getCartProductsUseCase(null);
    if (result is Success<List<ProductEntity>>) {
      safeEmit(CartProudctsLoadded(result.data));
      prodcuts = result.data;
      getCosts(result.data);
      return result.data;
    } else if (result is AppFailure<List<ProductEntity>>) {
      safeEmit(FailedLoadCartProducts(result.failure.errMessage));
      return [];
    }
    return [];
  }

  void getCosts(List<ProductEntity> products) {
    productsCost = 0.0;
    delivery = 0.0;
    for (var e in prodcuts) {
      productsCost +=
          double.parse(e.price) * double.parse(e.counter.toString());
    }
    productsCost = double.parse(productsCost.toStringAsFixed(2));
    delivery = double.parse((productsCost * 0.05).toStringAsFixed(2));
  }

  void updateCounter(String id, int counter) {
    final index = prodcuts.indexWhere((e) => e.id == id);
    if (index != -1) {
      prodcuts[index] = prodcuts[index].copyWith(counter: counter);
      safeEmit(CartProudctsLoadded(List.of(prodcuts)));
      getCosts(prodcuts);
    }
  }
}
