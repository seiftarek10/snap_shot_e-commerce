import 'package:meta/meta.dart';
import 'package:snap_shot/core/bloc/base_cubit.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/favorites/domain/use_case/add_fav_product_use_case.dart';
import 'package:snap_shot/features/favorites/domain/use_case/get_all_fav_products_use_case.dart';
import 'package:snap_shot/features/favorites/domain/use_case/remove_fav_product_use_case.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';

part 'get_favorites_products_state.dart';

class FavoritesProductsCubit extends BaseCubit<GetFavoritesProductsState> {
  FavoritesProductsCubit(
    this._allFavProductsUseCase,
    this._addFavProductUseCase,
    this._removeFavProductUseCase,
  ) : super(const GetFavoritesProductsInitial());
  final GetAllFavProductsUseCase _allFavProductsUseCase;
  final AddFavProductUseCase _addFavProductUseCase;
  final RemoveFavProductUseCase _removeFavProductUseCase;

  List<ProductEntity> products = [];

  Future<List<ProductEntity>> getFavProudcts({
    required bool loadingState,
  }) async {
    if (loadingState) {
      safeEmit(const GettingFavoritesProudcts());
    }
    final result = await _allFavProductsUseCase.call(null);
    if (result is Success<List<ProductEntity>>) {
      safeEmit(LoaddedFavProucts(products: result.data));
      products = result.data;

      return result.data;
    } else if (result is AppFailure<List<ProductEntity>>) {
      safeEmit(GetFavProuctsFailure(result.failure.errMessage));
      return [];
    }
    return [];
  }

  Future<void> toggleFavProduct({
    required bool isFav,
    required ProductEntity product,
  }) async {
    if (isFav) {
      safeEmit(const GettingFavoritesProudcts());

      await _removeFavProduct(product.id);
    } else {
      await _addFavProduct(product);
    }
  }

  Future<void> _addFavProduct(ProductEntity product) async {
    final result = await _addFavProductUseCase.call(product);
    if (result is Success) {
      safeEmit(AddedToFavProducts(product.id));
    }
    if (result is AppFailure) {
      safeEmit(FailedAddToFav(result.failure.errMessage));
    }
  }

  Future<void> _removeFavProduct(String id) async {
    final result = await _removeFavProductUseCase.call(id);
    if (result is Success) {
      safeEmit(RemovedFromFavProducts(id));
    }
    if (result is AppFailure) {
      safeEmit(FailedRemoveFromFav(result.failure.errMessage));
    }
  }
}
