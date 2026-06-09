import 'package:dio/dio.dart';
import 'package:snap_shot/core/data_source/local_data_source/Hive/hive_boxes_names.dart';
import 'package:snap_shot/core/data_source/local_data_source/Hive/hive_services.dart';
import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';
import 'package:snap_shot/core/data_source/remote_data_source/api/api_interface.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/service_interface.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/core/models/order_model.dart';
import 'package:snap_shot/core/shared_domain_data/all_products/data/data_source/local/home_local_data_source_impl.dart';
import 'package:snap_shot/core/shared_domain_data/all_products/data/data_source/remote/home_remote_impl.dart';
import 'package:snap_shot/core/shared_domain_data/all_products/data/repo/home_repo_impl.dart';
import 'package:snap_shot/core/shared_domain_data/all_products/domain/repo/home_repo.dart';
import 'package:snap_shot/core/shared_domain_data/all_products/domain/use_case/get_all_products_use_case.dart';
import 'package:snap_shot/features/authentication/data/data_source/local/auth_local_data_source_impl.dart';
import 'package:snap_shot/features/authentication/data/data_source/remote/firebase_auth_services.dart';
import 'package:snap_shot/features/authentication/data/repos/auth_repo_impl.dart';
import 'package:snap_shot/features/authentication/domain/repos/auth_repo.dart';
import 'package:snap_shot/features/authentication/domain/use_case/send_otp_use_case.dart';
import 'package:snap_shot/features/authentication/domain/use_case/sign_up_use_case.dart';
import 'package:snap_shot/features/authentication/domain/use_case/sing_in_use_case.dart';
import 'package:snap_shot/features/authentication/domain/use_case/verify_otp_use_case.dart';
import 'package:snap_shot/features/authentication/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:snap_shot/features/authentication/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:snap_shot/features/cart/presentation/manager/cart_cubit/user_cart_manager_cubit.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/cart/data/data_source/local/cart_local_data_source.dart';
import 'package:snap_shot/features/cart/data/data_source/local/cart_local_data_source_impl.dart';
import 'package:snap_shot/features/cart/data/data_source/remote/cart_remote_data_source.dart';
import 'package:snap_shot/features/cart/data/data_source/remote/cart_remote_data_source_impl.dart';
import 'package:snap_shot/features/cart/data/repos/cart_repo_impl.dart';
import 'package:snap_shot/features/cart/domain/repos/cart_repo.dart';
import 'package:snap_shot/features/cart/domain/use_cases/add_to_cart_use_case.dart';
import 'package:snap_shot/features/cart/domain/use_cases/get_cart_products_use_case.dart';
import 'package:snap_shot/features/cart/domain/use_cases/remove_from_cart_use_case.dart';
import 'package:snap_shot/features/cart/presentation/manager/get_cart_cubit/get_cart_proudcts_cubit.dart';
import 'package:snap_shot/features/checkout/data/data_source/remote/checkout_remote_data_source.dart';
import 'package:snap_shot/features/checkout/data/data_source/remote/checkout_remote_data_source_impl.dart';
import 'package:snap_shot/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:snap_shot/core/utils/stripe_service.dart';
import 'package:snap_shot/features/checkout/domain/repos/checkout_repo.dart';
import 'package:snap_shot/features/user_orders/domain/use_cases/get_user_data_use_case.dart';
import 'package:snap_shot/features/user_orders/domain/use_cases/make_order_use_case.dart';
import 'package:snap_shot/features/checkout/domain/use_case/make_payment_use_case.dart';
import 'package:snap_shot/features/checkout/presentation/manager/checkout/checkout_cubit.dart';
import 'package:snap_shot/features/favorites/data/data_source/local/fav_local_data_source.dart';
import 'package:snap_shot/features/favorites/data/data_source/local/fav_local_data_source_impl.dart';
import 'package:snap_shot/features/favorites/data/data_source/remote/fav_remote_data_source.dart';
import 'package:snap_shot/features/favorites/data/data_source/remote/fav_remote_data_source_impl.dart';
import 'package:snap_shot/features/favorites/data/repos/fav_repo_impl.dart';
import 'package:snap_shot/features/favorites/domain/repos/favorites_repo.dart';
import 'package:snap_shot/features/favorites/domain/use_case/add_fav_product_use_case.dart';
import 'package:snap_shot/features/favorites/domain/use_case/get_all_fav_products_use_case.dart';
import 'package:snap_shot/features/favorites/domain/use_case/remove_fav_product_use_case.dart';
import 'package:snap_shot/features/favorites/presentation/managers/get_fav_products/get_favorites_products_cubit.dart';
import 'package:snap_shot/core/models/product_model.dart';
import 'package:snap_shot/features/initial_screen_manager/data/data_source/init_local_data_source.dart';
import 'package:snap_shot/features/initial_screen_manager/data/data_source/init_local_data_source_impl.dart';
import 'package:snap_shot/features/initial_screen_manager/data/repo/init_repo_impl.dart';
import 'package:snap_shot/features/initial_screen_manager/domain/repo/init_app_repo.dart';
import 'package:snap_shot/features/initial_screen_manager/domain/use_cases/is_first_time_use_case.dart';
import 'package:snap_shot/features/initial_screen_manager/domain/use_cases/is_logged_in_use_case.dart';
import 'package:snap_shot/features/initial_screen_manager/presentation/manager/cubit/init_app_cubit.dart';
import 'package:snap_shot/features/user_orders/data/data%20source/local/orders_local_data_sorce.dart';
import 'package:snap_shot/features/user_orders/data/data%20source/local/orders_local_data_source_impl.dart';
import 'package:snap_shot/features/user_orders/data/data%20source/remote/orders_remote_data_source.dart';
import 'package:snap_shot/features/user_orders/data/data%20source/remote/orders_remote_data_source_impl.dart';
import 'package:snap_shot/features/user_orders/data/repos/orders_repo_impl.dart';
import 'package:snap_shot/features/user_orders/domain/repos/orders_repo.dart';
import 'package:snap_shot/features/user_orders/domain/use_cases/get_user_orders_use_case.dart';
import 'package:snap_shot/features/user_orders/presentation/manager/cubit/get_all_user_orders_cubit.dart';
import 'package:snap_shot/core/shared_managers/get_products_cubit/get_all_products_cubit.dart';

Future<void> setupUserGetIt() async {
  // Features
  _initAppFeature();
  _initAuthFeature();
  _initHomeFeature();
  _initFavoritesFeature();
  _initCartFeature();
  _initCheckoutFeature();
  _initOrdersFeature();
}

void _initAuthFeature() {
  // Local Service
  sl.registerLazySingleton<ILocalDataBaseServices<UserModel>>(
    () => HiveServices<UserModel>(HiveBoxesNames.instance.userBox),
  );
  sl.registerLazySingleton<ILocalDataBaseServices<bool>>(
    () => HiveServices<bool>(HiveBoxesNames.instance.firstTimeBox),
  );
  // stripe service
  sl.registerLazySingleton(() => StripeService(sl<Dio>()));

  // Data Sources & Repo
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      FirebaseAuthServices(sl<IRemoteDataBaseServices>()),
      AuthLocaldataSourceImpl(
        sl<ILocalDataBaseServices<UserModel>>(),
        sl<ILocalDataBaseServices<bool>>(),
      ),
      sl<StripeService>(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => SignUpUseCase(sl<AuthRepo>()));
  sl.registerLazySingleton(() => SendOtpUseCase(sl<AuthRepo>()));
  sl.registerLazySingleton(() => VerifyOtpUseCase(sl<AuthRepo>()));
  sl.registerLazySingleton(() => SignInUseCase(sl<AuthRepo>()));

  // Cubits
  sl.registerFactory(
    () => SignUpCubit(
      sl<SignUpUseCase>(),
      sl<SendOtpUseCase>(),
      sl<VerifyOtpUseCase>(),
    ),
  );
  sl.registerFactory(() => SignInCubit(sl<SignInUseCase>()));
}

void _initHomeFeature() {
  // Local Service
  sl.registerLazySingleton<ILocalDataBaseServices<ProductModel>>(
    () => HiveServices(HiveBoxesNames.instance.productsBox),
    instanceName: HiveBoxesNames.instance.productsBox,
  );
  sl.registerLazySingleton<ILocalDataBaseServices<ProductModel>>(
    () => HiveServices(HiveBoxesNames.instance.favProductsBox),
    instanceName: HiveBoxesNames.instance.favProductsBox,
  );
  sl.registerLazySingleton<ILocalDataBaseServices<ProductModel>>(
    () => HiveServices(HiveBoxesNames.instance.cartProdcutBox),
    instanceName: HiveBoxesNames.instance.cartProdcutBox,
  );

  // Repo
  sl.registerLazySingleton<ProductsRepo>(
    () => ProductsRepoImpl(
      ProductsRemoteDataSourceImpl(
        sl<IApiServices>(),
        sl<IRemoteDataBaseServices>(),
      ),
      ProductsLocalDataSourceImpl(
        sl<ILocalDataBaseServices<ProductModel>>(
          instanceName: HiveBoxesNames.instance.productsBox,
        ),
      ),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetAllProductsUseCase(sl<ProductsRepo>()));
  sl.registerLazySingleton(() => AddFavProductUseCase(sl<FavoritesRepo>()));
  sl.registerLazySingleton(() => RemoveFavProductUseCase(sl<FavoritesRepo>()));
  sl.registerLazySingleton(() => AddToCartUseCase(sl<CartRepo>()));
  sl.registerLazySingleton(() => RemoveFromCartUseCase(sl<CartRepo>()));

  // Cubits
  sl.registerFactory(() => GetAllProductsCubit(sl<GetAllProductsUseCase>()));

  sl.registerFactory(
    () => UserCartManegerCubit(
      sl<AddToCartUseCase>(),
      sl<RemoveFromCartUseCase>(),
    ),
  );
}

void _initFavoritesFeature() {
  // data sources
  sl.registerLazySingleton<FavProductsRemoteDataSource>(
    () => FavProuctsRemoteDataSourceImpl(sl<IRemoteDataBaseServices>()),
  );
  sl.registerLazySingleton<FavProductsLocalDataSource>(
    () => FavProudctsLocalDataSourceImpl(
      sl<ILocalDataBaseServices<ProductModel>>(
        instanceName: HiveBoxesNames.instance.favProductsBox,
      ),
      sl<ILocalDataBaseServices<ProductModel>>(
        instanceName: HiveBoxesNames.instance.productsBox,
      ),

      sl<ILocalDataBaseServices<UserModel>>(),
    ),
  );

  //repos
  sl.registerLazySingleton<FavoritesRepo>(
    () => FavoritesRepoImpl(
      sl<FavProductsLocalDataSource>(),
      sl<FavProductsRemoteDataSource>(),
    ),
  );
  //Use Cases
  sl.registerLazySingleton(() => GetAllFavProductsUseCase(sl<FavoritesRepo>()));
  //Cubits
  sl.registerFactory(
    () => FavoritesProductsCubit(
      sl<GetAllFavProductsUseCase>(),
      sl<AddFavProductUseCase>(),
      sl<RemoveFavProductUseCase>(),
    ),
  );
}

void _initCartFeature() {
  //data source
  sl.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(sl<IRemoteDataBaseServices>()),
  );
  sl.registerLazySingleton<CartLocalDataSource>(
    () => CartLocalDataSourceImpl(
      sl<ILocalDataBaseServices<ProductModel>>(
        instanceName: HiveBoxesNames.instance.cartProdcutBox,
      ),
      sl<ILocalDataBaseServices<ProductModel>>(
        instanceName: HiveBoxesNames.instance.productsBox,
      ),

      sl<ILocalDataBaseServices<UserModel>>(),
    ),
  );

  // repos
  sl.registerLazySingleton<CartRepo>(
    () => CartRepoImpl(sl<CartRemoteDataSource>(), sl<CartLocalDataSource>()),
  );

  //use cases
  sl.registerLazySingleton(() => GetCartProductsUseCase(sl<CartRepo>()));

  // cubits
  sl.registerFactory(() => GetCartProudctsCubit(sl<GetCartProductsUseCase>()));
}

void _initCheckoutFeature() {
  //data source
  sl.registerLazySingleton<CheckoutRemoteDataSource>(
    () => CheckoutRemoteDataSourceImpl(
      sl<IRemoteDataBaseServices>(),
      sl<StripeService>(),
    ),
  );

  // repos
  sl.registerLazySingleton<CheckoutRepo>(
    () => CheckoutRepoImpl(sl<CheckoutRemoteDataSource>()),
  );

  //use cases
  sl.registerLazySingleton(() => MakePaymentUseCase(sl<CheckoutRepo>()));

  // cubits
  sl.registerFactory(
    () => CheckoutCubit(
      sl<MakeOrderUseCase>(),
      sl<GetUserDataUseCase>(),
      sl<MakePaymentUseCase>(),
    ),
  );
}

void _initOrdersFeature() {
  //data source
  sl.registerLazySingleton<OrdersRemoteDataSource>(
    () => OrdersRemoteDataSourceImpl(sl<IRemoteDataBaseServices>()),
  );

  sl.registerLazySingleton<ILocalDataBaseServices<OrderModel>>(
    () => HiveServices<OrderModel>(HiveBoxesNames.instance.ordersBox),
  );

  sl.registerLazySingleton<OrdersLocalDataSorce>(
    () => OrdersLocalDataSourceImpl(
      sl<ILocalDataBaseServices<OrderModel>>(),
      sl<ILocalDataBaseServices<UserModel>>(),
      sl<ILocalDataBaseServices<ProductModel>>(
        instanceName: HiveBoxesNames.instance.cartProdcutBox,
      ),
      sl<ILocalDataBaseServices<ProductModel>>(
        instanceName: HiveBoxesNames.instance.productsBox,
      ),
    ),
  );
  // repos
  sl.registerLazySingleton<UserOrdersRepo>(
    () => OrdersRepoImpl(
      sl<OrdersRemoteDataSource>(),
      sl<OrdersLocalDataSorce>(),
    ),
  );

  //use cases
  sl.registerLazySingleton(() => MakeOrderUseCase(sl<UserOrdersRepo>()));
  sl.registerLazySingleton(() => GetUserDataUseCase(sl<UserOrdersRepo>()));
  sl.registerLazySingleton(() => GetUserOrdersUseCase(sl<UserOrdersRepo>()));

  // cubits
  sl.registerFactory(() => GetAllUserOrdersCubit(sl<GetUserOrdersUseCase>()));
}

void _initAppFeature() {
  //data source
  sl.registerLazySingleton<InitAppLocalDataSource>(
    () => InitAppLocalDataSourceImpl(
      sl<ILocalDataBaseServices<UserModel>>(),
      sl<ILocalDataBaseServices<bool>>(),
    ),
  );

  // repos
  sl.registerLazySingleton<InitAppRepo>(
    () => InitAppRepoImpl(sl<InitAppLocalDataSource>()),
  );
  //use cases
  sl.registerLazySingleton(() => IsFirstTimeUseCase(sl<InitAppRepo>()));
  sl.registerLazySingleton(() => IsLoggedInUseCase(sl<InitAppRepo>()));

  // cubits
  sl.registerFactory(
    () => InitAppCubit(sl<IsFirstTimeUseCase>(), sl<IsLoggedInUseCase>()),
  );
}
