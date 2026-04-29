import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:snap_shot/core/data_source/local_data_source/Hive/hive_boxes_names.dart';
import 'package:snap_shot/core/data_source/local_data_source/Hive/hive_services.dart';
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
import 'package:snap_shot/features/home/data/data_source/remote/home_remote_impl.dart';
import 'package:snap_shot/features/home/data/repo/home_repo_impl.dart';
import 'package:snap_shot/features/home/domain/repo/home_repo.dart';
import 'package:snap_shot/features/home/domain/use_case/get_all_products_use_case.dart';
import 'package:snap_shot/features/home/presentation/view%20model/cubit/get_all_products_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<IRemoteDataBaseServices>(
    () => ApiServices(getIt.get<Dio>()),
  );

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      FirebaseAuthServices(getIt.get<IRemoteDataBaseServices>()),
      AuthLocaldataSourceImpl(
        HiveServices<UserEntity>(HiveBoxesNames.instance.userBox),
      ),
    ),
  );
  getIt.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(getIt.get<AuthRepo>()),
  );
  getIt.registerLazySingleton<SendOtpUseCase>(
    () => SendOtpUseCase(getIt.get<AuthRepo>()),
  );
  getIt.registerLazySingleton<VerifyOtpUseCase>(
    () => VerifyOtpUseCase(getIt.get<AuthRepo>()),
  );
  getIt.registerFactory<SignUpCubit>(
    () => SignUpCubit(
      getIt.get<SignUpUseCase>(),
      getIt.get<SendOtpUseCase>(),
      getIt.get<VerifyOtpUseCase>(),
    ),
  );

  getIt.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(getIt.get<AuthRepo>()),
  );

  getIt.registerFactory<SignInCubit>(
    () => SignInCubit(getIt.get<SignInUseCase>()),
  );
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      HomeRemoteDataSourceImpl(getIt.get<IRemoteDataBaseServices>()),
    ),
  );
  getIt.registerLazySingleton<GetAllProductsUseCase>(
    () => GetAllProductsUseCase(getIt.get<HomeRepo>()),
  );

  getIt.registerFactory<GetAllProductsCubit>(
    () => GetAllProductsCubit(getIt.get<GetAllProductsUseCase>()),
  );
}
