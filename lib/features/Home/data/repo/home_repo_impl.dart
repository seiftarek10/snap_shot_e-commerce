import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:snap_shot/core/errors/dio_errors.dart';
import 'package:snap_shot/core/errors/failure.dart';
import 'package:snap_shot/core/errors/firesotre_error.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/home/data/data_source/local/home_local_data_source.dart';
import 'package:snap_shot/features/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:snap_shot/core/models/product_model.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';
import 'package:snap_shot/features/home/domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _remoteDataSource;
  final HomeLocalDataSource _localDataSource;

  HomeRepoImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Result<List<ProductEntity>>> getAllProducts() async {
    try {
      List<ProductModel> rawProducts = _localDataSource.getProductsData();

      if (rawProducts.isEmpty) {
        rawProducts = await _remoteDataSource.getAllProducts();
        await _localDataSource.saveProductsData(rawProducts);
      }

      List<ProductEntity> products = rawProducts.map((product) {
        return product.toEntity();
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
}
