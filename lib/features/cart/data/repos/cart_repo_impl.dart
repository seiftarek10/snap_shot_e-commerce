import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snap_shot/core/errors/failure.dart';
import 'package:snap_shot/core/errors/firesotre_error.dart';
import 'package:snap_shot/core/models/product_model.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/cart/data/data_source/local/cart_local_data_source.dart';
import 'package:snap_shot/features/cart/data/data_source/remote/cart_remote_data_source.dart';
import 'package:snap_shot/features/cart/domain/repos/cart_repo.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';

class CartRepoImpl implements CartRepo {
  final CartRemoteDataSource _remoteDataSource;
  final CartLocalDataSource _localDataSource;

  CartRepoImpl(this._remoteDataSource, this._localDataSource);
  @override
  Future<Result<List<ProductEntity>>> getCartProducts() async {
    try {
      List<ProductModel> data = _localDataSource.getLoaclCartProducts();
      if (data.isEmpty) {
        String? uid = _localDataSource.getUid();
        if (uid == null) {
          return const Success([]);
        }
        data = await _remoteDataSource.getCartProducts(uid: uid);
        await _localDataSource.saveCartProducts(data);
      }
      List<ProductEntity> products = data.map((e) => e.toEntity()).toList();
      return Success(products);
    } catch (e) {
      if (e is FirebaseException) {
        return AppFailure(FirestoreError.handleFireStoreError(e));
      }
      return AppFailure(Failure(e.toString()));
    }
  }
}
