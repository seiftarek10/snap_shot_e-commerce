import 'package:dio/dio.dart';
import 'package:snap_shot/core/errors/dio_errors.dart';
import 'package:snap_shot/core/errors/failure.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:snap_shot/features/home/data/models/product_model.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';
import 'package:snap_shot/features/home/domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _dataSourceImpl;
  HomeRepoImpl(this._dataSourceImpl);
  @override
  Future<Result<List<ProductEntity>>> getAllProducts() async {
    try {
      List<ProductModel> data = await _dataSourceImpl.getAllProducts();
      List<ProductEntity> products = data
          .map((product) => product.toEntity())
          .toList();

      return Success(products);
    } catch (e) {
      if (e is DioException) {
        return AppFailure(AppDioException.handle(e));
      }
      return AppFailure(Failure(e.toString()));
    }
  }
}
