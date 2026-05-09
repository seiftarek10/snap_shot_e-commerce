import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:snap_shot/core/data_source/local_data_source/Hive/hive_boxes_names.dart';
import 'package:snap_shot/core/data_source/local_data_source/Hive/hive_services.dart';
import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';
import 'package:snap_shot/core/data_source/remote_data_source/api/dio_services.dart';
import 'package:snap_shot/core/data_source/remote_data_source/api/api_interface.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/fire_base/firebase_firestore_service.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/service_interface.dart';
import 'package:snap_shot/features/authentication/data/data_source/local/auth_local_data_source_impl.dart';
import 'package:snap_shot/features/authentication/data/data_source/remote/firebase_auth_services.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/authentication/data/repos/auth_repo_impl.dart';
import 'package:snap_shot/features/authentication/domain/repos/auth_repo.dart';
import 'package:snap_shot/features/authentication/domain/use_case/send_otp_use_case.dart';
import 'package:snap_shot/features/authentication/domain/use_case/sign_up_use_case.dart';
import 'package:snap_shot/features/authentication/domain/use_case/sing_in_use_case.dart';
import 'package:snap_shot/features/authentication/domain/use_case/verify_otp_use_case.dart';
import 'package:snap_shot/features/authentication/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:snap_shot/features/authentication/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:snap_shot/features/home/data/data_source/local/home_local_data_source_impl.dart';
import 'package:snap_shot/features/home/data/data_source/remote/home_remote_impl.dart';
import 'package:snap_shot/features/home/data/models/product_model.dart';
import 'package:snap_shot/features/home/data/repo/home_repo_impl.dart';
import 'package:snap_shot/features/home/domain/repo/home_repo.dart';
import 'package:snap_shot/features/home/domain/use_case/add_fav_product_use_case.dart';
import 'package:snap_shot/features/home/domain/use_case/add_to_cart_use_case.dart';
import 'package:snap_shot/features/home/domain/use_case/get_all_products_use_case.dart';
import 'package:snap_shot/features/home/domain/use_case/remove_fav_product_use_case.dart';
import 'package:snap_shot/features/home/domain/use_case/remove_from_cart_use_case.dart';
import 'package:snap_shot/features/home/presentation/manager/cart_cubit/user_home_cart_cubit.dart';
import 'package:snap_shot/features/home/presentation/manager/fav_cubit/user_home_favorites_cubit_cubit.dart';
import 'package:snap_shot/features/home/presentation/manager/get_products_cubit/get_all_products_cubit.dart';

final sl = GetIt.instance;

Future<void> setupGetIt() async {
  // Core / External
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<IApiServices>(() => DioServices(sl<Dio>()));
  sl.registerLazySingleton<IRemoteDataBaseServices>(
    () => FirebaseFirestoreService(),
  );

  // Features
  _initAuthFeature();
  _initHomeFeature();
}

void _initAuthFeature() {
  // Local Service
  sl.registerLazySingleton<ILocalDataBaseServices<UserModel>>(
    () => HiveServices<UserModel>(HiveBoxesNames.instance.userBox),
  );

  // Data Sources & Repo
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      FirebaseAuthServices(sl<IRemoteDataBaseServices>()),
      AuthLocaldataSourceImpl(sl<ILocalDataBaseServices<UserModel>>()),
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
  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      HomeRemoteDataSourceImpl(
        sl<IApiServices>(),
        sl<IRemoteDataBaseServices>(),
      ),
      HomeLocalDataSourceImpl(
        sl<ILocalDataBaseServices<ProductModel>>(
          instanceName: HiveBoxesNames.instance.productsBox,
        ),
        sl<ILocalDataBaseServices<ProductModel>>(
          instanceName: HiveBoxesNames.instance.favProductsBox,
        ),
        sl<ILocalDataBaseServices<ProductModel>>(
          instanceName: HiveBoxesNames.instance.cartProdcutBox,
        ),
        sl<ILocalDataBaseServices<UserModel>>(),
      ),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetAllProductsUseCase(sl<HomeRepo>()));
  sl.registerLazySingleton(() => AddFavProductUseCase(sl<HomeRepo>()));
  sl.registerLazySingleton(() => RemoveFavProductUseCase(sl<HomeRepo>()));
  sl.registerLazySingleton(() => AddToCartUseCase(sl<HomeRepo>()));
  sl.registerLazySingleton(() => RemoveFromCartUseCase(sl<HomeRepo>()));

  // Cubits
  sl.registerFactory(() => GetAllProductsCubit(sl<GetAllProductsUseCase>()));
  sl.registerFactory(
    () => UserHomeFavoritesCubit(
      sl<AddFavProductUseCase>(),
      sl<RemoveFavProductUseCase>(),
    ),
  );
  sl.registerFactory(
    () =>
        UserHomeCartCubit(sl<AddToCartUseCase>(), sl<RemoveFromCartUseCase>()),
  );
}
