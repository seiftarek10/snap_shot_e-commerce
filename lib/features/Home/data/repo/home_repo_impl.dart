import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:snap_shot/core/errors/dio_errors.dart';
import 'package:snap_shot/core/errors/failure.dart';
import 'package:snap_shot/core/errors/firesotre_error.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/home/data/data_source/local/home_local_data_source.dart';
import 'package:snap_shot/features/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:snap_shot/features/home/data/models/product_model.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';
import 'package:snap_shot/features/home/domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _remoteDataSource;
  final HomeLocalDataSource _localDataSource;

  HomeRepoImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Result<List<ProductEntity>>> getAllProducts() async {
    try {
      final localProducts = _localDataSource.getProductsData();

      final favs = await _remoteDataSource.getFavProducts();
      final favIds = favs.map((fav) => fav.id).toSet();

      if (localProducts.isNotEmpty) {
        final products = localProducts.map((product) {
          final entity = product.toEntity();
          if (favIds.contains(entity.id)) {
            return entity.copyWith(isFav: true);
          }
          return entity;
        }).toList();

        return Success(products);
      }

      final remoteProducts = await _remoteDataSource.getAllProducts();

      final products = remoteProducts.map((product) {
        final entity = product.toEntity();
        if (favIds.contains(entity.id)) {
          return entity.copyWith(isFav: true);
        }
        return entity;
      }).toList();
      await _localDataSource.saveProductsData(remoteProducts);

      return Success(products);
    } catch (e) {
      if (e is FirebaseException) {
        return AppFailure(FirestoreError.handleFireStoreError(e));
      }
      if (e is DioException) {
        return AppFailure(AppDioException.handle(e));
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

      await _remoteDataSource.addFavProduct(product: productModel);

      await _localDataSource.clear();


      return const Success(null);
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
      await _remoteDataSource.removeFavProduct(id: id);

      await _localDataSource.clear();


      return const Success(null);
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
