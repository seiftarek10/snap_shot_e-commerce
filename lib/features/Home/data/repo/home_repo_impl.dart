import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:snap_shot/core/errors/dio_errors.dart';
import 'package:snap_shot/core/errors/failure.dart';
import 'package:snap_shot/core/errors/firesotre_error.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/core/models/user_model.dart';
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
      final UserModel? currentUser = _localDataSource.getUserData();
      final String? uid = currentUser?.uid;

      Set<String?> favIds = {};
      Set<String?> cartIds = {};

      if (uid != null) {
        List<ProductModel> favs = _localDataSource.getFavProducts();
        List<ProductModel> cart = _localDataSource.getCartProducts();

        if (favs.isEmpty) {
          favs = await _remoteDataSource.getFavProducts(uid: uid);
          await _localDataSource.addFavProducts(products: favs);
        }
        if (cart.isEmpty) {
          cart = await _remoteDataSource.getCartProducts(uid: uid);
          await _localDataSource.addToCart(products: cart);
        }

        favIds = favs.map((e) => e.id).toSet();
        cartIds = cart.map((e) => e.id).toSet();
      }

      List<ProductModel> rawProducts = _localDataSource.getProductsData();

      if (rawProducts.isEmpty) {
        rawProducts = await _remoteDataSource.getAllProducts();
        await _localDataSource.saveProductsData(rawProducts);
      }

      final products = rawProducts.map((product) {
        return product.toEntity().copyWith(
          isFav: favIds.contains(product.id),
          inCart: cartIds.contains(product.id),
        );
      }).toList();

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
      productModel.isFav = true;
      UserModel? currentUser = _localDataSource.getUserData();
      String? uid = currentUser?.uid;
      if (uid != null) {
        await _remoteDataSource.addFavProduct(product: productModel, uid: uid);

        await _localDataSource.clearFavIds();
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
      final UserModel? currentUser = _localDataSource.getUserData();
      final String? uid = currentUser?.uid;
      if (uid != null) {
        await _remoteDataSource.removeFavProduct(prodcutId: id, uid: uid);
        await _localDataSource.clearFavIds();
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
  Future<Result<void>> addToCart({required ProductEntity product}) async {
    try {
      final UserModel? currentUser = _localDataSource.getUserData();
      final String? uid = currentUser?.uid;
      ProductModel productModel = ProductModel.fromEntity(product);
      if (uid != null) {
        await _remoteDataSource.addToCart(product: productModel, uid: uid);
        await _localDataSource.clearCartProducts();
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
  Future<Result<void>> removeFromCart({required String id}) async {
    try {
      final UserModel? currentUser = _localDataSource.getUserData();
      final String? uid = currentUser?.uid;
      if (uid != null) {
        await _remoteDataSource.removeFromCart(prodyctid: id, uid: uid);
        await _localDataSource.clearCartProducts();
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
