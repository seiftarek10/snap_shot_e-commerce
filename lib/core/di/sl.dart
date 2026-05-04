import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:snap_shot/core/data_source/local_data_source/Hive/hive_boxes_names.dart';
import 'package:snap_shot/core/data_source/local_data_source/Hive/hive_services.dart';
import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';
import 'package:snap_shot/core/data_source/remote_data_source/api/api_services.dart';
import 'package:snap_shot/core/data_source/remote_data_source/data_base_services_interfase.dart';
import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/features/authentication/data/data_source/local/auth_local_data_source_impl.dart';
import 'package:snap_shot/features/authentication/data/data_source/remote/firebase_auth_services.dart';
import 'package:snap_shot/features/authentication/data/repos/auth_repo_impl.dart';
import 'package:snap_shot/features/authentication/domain/repos/auth_repo.dart';
import 'package:snap_shot/features/authentication/domain/use_case/send_otp_use_case.dart';
import 'package:snap_shot/features/authentication/domain/use_case/sign_up_use_case.dart';
import 'package:snap_shot/features/authentication/domain/use_case/sing_in_use_case.dart';
import 'package:snap_shot/features/authentication/domain/use_case/verify_otp_use_case.dart';
import 'package:snap_shot/features/authentication/presentation/view%20model/cubit/sign_in_cubit.dart';
import 'package:snap_shot/features/authentication/presentation/view%20model/sign_up/sign_up_cubit.dart';
import 'package:snap_shot/features/home/data/data_source/local/home_local_data_source_impl.dart';
import 'package:snap_shot/features/home/data/data_source/remote/home_remote_impl.dart';
import 'package:snap_shot/features/home/data/repo/home_repo_impl.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';
import 'package:snap_shot/features/home/domain/repo/home_repo.dart';
import 'package:snap_shot/features/home/domain/use_case/get_all_products_use_case.dart';
import 'package:snap_shot/features/home/presentation/view%20model/cubit/get_all_products_cubit.dart';


final sl = GetIt.instance;

Future<void> setupGetIt() async {
  // Core / External
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<IRemoteDataBaseServices>(
    () => ApiServices(sl<Dio>()),
  );

  // Features
  _initAuthFeature();
  _initHomeFeature();
}

void _initAuthFeature() {
  // Local Service
  sl.registerLazySingleton<ILocalDataBaseServices<UserEntity>>(
    () => HiveServices<UserEntity>(HiveBoxesNames.instance.userBox),
  );

  // Data Sources & Repo
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      FirebaseAuthServices(sl<IRemoteDataBaseServices>()),
      AuthLocaldataSourceImpl(sl<ILocalDataBaseServices<UserEntity>>()),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => SendOtpUseCase(sl()));
  sl.registerLazySingleton(() => VerifyOtpUseCase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(sl()));

  // Cubits
  sl.registerFactory(() => SignUpCubit(sl(), sl(), sl()));
  sl.registerFactory(() => SignInCubit(sl()));
}
void _initHomeFeature() {
  // Local Service
  sl.registerLazySingleton<ILocalDataBaseServices<ProductEntity>>(
    () => HiveServices<ProductEntity>(HiveBoxesNames.instance.productsBox),
  );

  // Repo
  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      HomeRemoteDataSourceImpl(sl<IRemoteDataBaseServices>()),
      HomeLocalDataSourceImpl(sl<ILocalDataBaseServices<ProductEntity>>()),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetAllProductsUseCase(sl()));

  // Cubits
  sl.registerFactory(() => GetAllProductsCubit(sl()));
}