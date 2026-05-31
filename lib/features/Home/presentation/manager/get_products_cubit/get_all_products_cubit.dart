import 'package:flutter/material.dart';
import 'package:snap_shot/core/bloc/base_cubit.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';
import 'package:snap_shot/features/home/domain/use_case/get_all_products_use_case.dart';
import 'dart:math';
part 'get_all_products_state.dart';

class UserHomeProudctsCubit extends BaseCubit<UserHomeProudctsState> {
  UserHomeProudctsCubit(this._getAllProductsUseCase)
    : super(const GetAllProductsInitial());

  final GetAllProductsUseCase _getAllProductsUseCase;
  List<String> categories = [];
  List<ProductEntity> products = [];
  List<ProductEntity> fillterdProducts = [];

  Future<void> getAllProducts({bool? loadingState}) async {
    if (loadingState == null) {
      safeEmit(const GettingAllProducts());
    }
    final response = await _getAllProductsUseCase.call(null);
    if (response is Success<List<ProductEntity>>) {
      safeEmit(GetProductsSuccess(response.data));
      products = response.data;
      fillterdProducts = response.data;
      getCategories();
    }
    if (response is AppFailure<List<ProductEntity>>) {
      safeEmit(GetProductsFailure(response.failure.errMessage));
    }
  }

  void getCategories() {
    final uniqueCategories = products.map((e) => e.category).toSet().toList();
    categories = uniqueCategories;
  }

  RangeValues getPricesRange() {
    var prices = products.map((p) => double.parse(p.price)).toList();

    return RangeValues(prices.reduce(min), prices.reduce(max));
  }

  void changeCategory({required String category}) {
    if (category.toLowerCase() == 'All'.toLowerCase()) {
      fillterdProducts = products;
      safeEmit(GetProductsSuccess(fillterdProducts));

      return;
    }
    fillterdProducts = [];
    fillterdProducts = products
        .where((product) => product.category == category)
        .toList();
    safeEmit(GetProductsSuccess(fillterdProducts));
  }

  void searchByName({required String searchKey}) {
    if (searchKey.isEmpty) {
      safeEmit(GetProductsSuccess(fillterdProducts));
      return;
    }
    List<ProductEntity> searchResult = fillterdProducts
        .where(
          (product) =>
              product.name.toLowerCase().startsWith(searchKey.toLowerCase()),
        )
        .toList();

    safeEmit(GetProductsSuccess(searchResult));
  }

  List<ProductEntity> filterByRate(
    List<ProductEntity> filterdPricesList,
    List<String> allRates,
  ) {
    if (allRates.isEmpty) {
      return filterdPricesList;
    }
    List<ProductEntity> finalList = filterdPricesList
        .where(
          (product) => allRates.any(
            (rate) => product.rate.toLowerCase().startsWith(
              rate.toLowerCase().toString(),
            ),
          ),
        )
        .toList();

    return finalList;
  }

  List<ProductEntity> filterByPrice({required RangeValues currentRange}) {
    RangeValues allRange = getPricesRange();
    if (allRange.start == currentRange.start &&
        allRange.end == currentRange.end) {
      return products;
    }

    List<ProductEntity> filteredPricesList = fillterdProducts
        .where(
          (product) =>
              double.parse(product.price) >= currentRange.start &&
              double.parse(product.price) <= currentRange.end,
        )
        .toList();
    return filteredPricesList;
  }

  void filter(RangeValues currentRange, List<String> allRates) {
    List<ProductEntity> filterdPriceList = filterByPrice(
      currentRange: currentRange,
    );
    List<ProductEntity> finalList = filterByRate(filterdPriceList, allRates);

    safeEmit(GetProductsSuccess(finalList));
  }
}
