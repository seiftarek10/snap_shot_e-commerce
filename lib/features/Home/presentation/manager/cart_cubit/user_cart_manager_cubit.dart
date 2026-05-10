import 'package:meta/meta.dart';
import 'package:snap_shot/core/bloc/base_cubit.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';
import 'package:snap_shot/features/home/domain/use_case/add_to_cart_use_case.dart';
import 'package:snap_shot/features/home/domain/use_case/remove_from_cart_use_case.dart';

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
      await _removeFromCart(product.id);
    } else {
      await _addToCart(product);
    }
  }

  Future<void> _addToCart(ProductEntity product) async {
    final result = await _addToCartUseCase.call(product);
    if (result is Success) {
      safeEmit(AddToCartSuccess(id: product.id));
    }
    if (result is AppFailure) {
      safeEmit(AddToCartFailure(errMessage: result.failure.errMessage));
    }
  }

  Future<void> _removeFromCart(String id) async {
    final result = await _removeFromCartUseCase.call(id);
    if (result is Success) {
      safeEmit(RemoveFromCartSuccess(id: id));
    }
    if (result is AppFailure) {
      safeEmit(RemoveFromCartFailure(errMessage: result.failure.errMessage));
    }
  }
}
