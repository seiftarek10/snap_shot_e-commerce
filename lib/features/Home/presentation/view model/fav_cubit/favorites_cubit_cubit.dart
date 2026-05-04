
import 'package:meta/meta.dart';
import 'package:snap_shot/core/bloc/base_cubit.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';
import 'package:snap_shot/features/home/domain/use_case/add_fav_product_use_case.dart';
import 'package:snap_shot/features/home/domain/use_case/remove_fav_product_use_case.dart';

part 'favorites_cubit_state.dart';

class FavoritesCubit extends BaseCubit<FavoritesCubitState> {
  FavoritesCubit(this._addFavProductUseCase, this._removeFavProductUseCase)
    : super(FavoritesCubitInitial());
  final AddFavProductUseCase _addFavProductUseCase;
  final RemoveFavProductUseCase _removeFavProductUseCase;

  Future<void> toggleFavProduct({
    required bool isFav,
    required ProductEntity product,
  }) async {
    if (isFav) {
      await _removeFavProduct(product.id);
    } else {
      await _addFavProduct(product);
    }
  }

  Future<void> _addFavProduct(ProductEntity product) async {
    final result = await _addFavProductUseCase.call(product);
    if (result is Success) {
      safeEmit(AddFavoriteItemSuccess());
    }
    if (result is AppFailure) {
      safeEmit(AddFavoriteItemFailure(errMessage: result.failure.errMessage));
    }
  }

  Future<void> _removeFavProduct(String id) async {
    final result = await _removeFavProductUseCase.call(id);
    if (result is Success) {
      safeEmit(RemoveFavoriteItemSuccess());
    }
    if (result is AppFailure) {
      safeEmit(
        RemoveFavoriteItemFailure(errMessage: result.failure.errMessage),
      );
    }
  }
}
