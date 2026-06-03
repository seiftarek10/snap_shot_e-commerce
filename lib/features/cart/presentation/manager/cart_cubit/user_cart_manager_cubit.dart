import 'package:meta/meta.dart';
import 'package:snap_shot/core/bloc/base_cubit.dart';
import 'package:snap_shot/core/shared_domain_data/all_products/domain/entity/product_entity.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/cart/domain/use_cases/add_to_cart_use_case.dart';
import 'package:snap_shot/features/cart/domain/use_cases/remove_from_cart_use_case.dart';

part 'user_cart_manager_state.dart';

class UserCartManegerCubit extends BaseCubit<UserCartManagerState> {
  UserCartManegerCubit(this._addToCartUseCase, this._removeFromCartUseCase)
    : super(const UserHomeCartInitial());

  final AddToCartUseCase _addToCartUseCase;
  final RemoveFromCartUseCase _removeFromCartUseCase;

  Future<void> toggleCartProdcut({
    required bool inCart,
    required ProductEntity product,
  }) async {
    safeEmit(const UserHomeCartLoading());
    if (inCart) {
      await removeFromCart(product.id);
    } else {
      await addToCart(product);
    }
  }

  Future<void> addToCart(ProductEntity product) async {
    final result = await _addToCartUseCase.call(product);
    if (result is Success) {
      safeEmit(AddToCartSuccess(id: product.id));
    }
    if (result is AppFailure) {
      safeEmit(AddToCartFailure(errMessage: result.failure.errMessage));
    }
  }

  Future<void> removeFromCart(String id) async {
    final result = await _removeFromCartUseCase.call(id);
    if (result is Success) {
      safeEmit(RemoveFromCartSuccess(id: id));
    }
    if (result is AppFailure) {
      safeEmit(RemoveFromCartFailure(errMessage: result.failure.errMessage));
    }
  }
}
