import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:snap_shot/core/errors/dio_errors.dart';
import 'package:snap_shot/core/errors/failure.dart';
import 'package:snap_shot/core/errors/firesotre_error.dart';
import 'package:snap_shot/core/models/product_model.dart';
import 'package:snap_shot/core/shared_domain_data/all_products/domain/entity/product_entity.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/favorites/data/data_source/local/fav_local_data_source.dart';
import 'package:snap_shot/features/favorites/data/data_source/remote/fav_remote_data_source.dart';
import 'package:snap_shot/features/favorites/domain/repos/favorites_repo.dart';

class FavoritesRepoImpl implements FavoritesRepo {
  const FavoritesRepoImpl(this._localDataSource, this._remoteDataSource);
  final FavProductsLocalDataSource _localDataSource;
  final FavProductsRemoteDataSource _remoteDataSource;

  @override
  Future<Result<List<ProductEntity>>> getAllFavoritesProudcts() async {
    try {
      List<ProductModel> data = _localDataSource.getFavProducts();
      if (data.isEmpty) {
        String? uid = _localDataSource.getUserId();

        if (uid == null) {
          return const Success([]);
        }
        data = await _remoteDataSource.getFavProducts(uid: uid);
        await _localDataSource.saveFavProducts(products: data);
      }
      final List<ProductEntity> products = data
          .map((e) => e.toEntity())
          .toList();
      return Success(products);
    } catch (e) {
      if (e is FirebaseException) {
        return AppFailure(FirestoreError.handleFireStoreError(e));
      }
      return AppFailure(Failure(e.toString()));
    }
  }

  @override
  Future<Result<void>> addFavoriteProduct({
    required ProductEntity product,
  }) async {
    try {
      final productModel = ProductModel.fromEntity(product);
      productModel.isFav = true;
      final String? uid = _localDataSource.getUserId();

      if (uid != null) {
        await _remoteDataSource.addFavProduct(product: productModel, uid: uid);

        await _localDataSource.addFavProduct(product: productModel);
        await _localDataSource.updateFavProduct(
          productId: productModel.id!,
          isFav: true,
        );
        return const Success(null);
      }
      return AppFailure(const Failure('user id not found'));
    } catch (e) {
      if (e is DioException) {
        return AppFailure(AppDioException.handle(e));
      }
      if (e is FirebaseException) {
        return AppFailure(FirestoreError.handleFireStoreError(e));
      }
      return AppFailure(Failure(e.toString()));
    }
  }

  @override
  Future<Result<void>> removeFavProduct({required String id}) async {
    try {
      final String? uid = _localDataSource.getUserId();

      if (uid != null) {
        await _remoteDataSource.removeFavProduct(prodcutId: id, uid: uid);
        await _localDataSource.removeFavProduct(id: id);
        await _localDataSource.updateFavProduct(productId: id, isFav: false);
        return const Success(null);
      }
      return AppFailure(const Failure('user id not found'));
    } catch (e) {
      if (e is DioException) {
        return AppFailure(AppDioException.handle(e));
      }
      if (e is FirebaseException) {
        return AppFailure(FirestoreError.handleFireStoreError(e));
      }
      return AppFailure(Failure(e.toString()));
    }
  }
}
