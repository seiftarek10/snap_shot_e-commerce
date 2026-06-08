import 'package:snap_shot/core/data_source/local_data_source/Hive/hive_boxes_names.dart';
import 'package:snap_shot/core/data_source/local_data_source/Hive/hive_services.dart';
import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/service_interface.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/core/shared_domain_data/all_orders/data/data_source/remote/all_orders_remote_data_source.dart';
import 'package:snap_shot/core/shared_domain_data/all_orders/data/data_source/remote/all_orders_remote_data_source_impl.dart';
import 'package:snap_shot/core/shared_domain_data/all_orders/data/repos/all_orders_repo_impl.dart';
import 'package:snap_shot/core/shared_domain_data/all_orders/domain/repos/all_orders_repo.dart';
import 'package:snap_shot/core/shared_domain_data/all_orders/domain/use_case/get_all_orders_use_case.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/data/data_source/local_data_source/all_users_local_data_source.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/data/data_source/local_data_source/all_users_local_data_source_impl.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/data/data_source/remote_data_source/all_users_remote_data_source.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/data/data_source/remote_data_source/all_users_remote_data_sourec_impl.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/data/repos/all_users_repo_impl.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/domain/repos/all_users_repo.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/domain/use_cases/check_data_consistent_use_case.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/domain/use_cases/get_all_user_use_case.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/owenr_all_orders/presentation/manager/get_all_app_orders/get_all_app_orders_cubit.dart';
import 'package:snap_shot/features/owner_home/data/data_source/remote_data_source/owner_home_remote.dart';
import 'package:snap_shot/features/owner_home/data/data_source/remote_data_source/owner_home_remote_impl.dart';
import 'package:snap_shot/features/owner_home/data/repos/owner_home_repo_impl.dart';
import 'package:snap_shot/features/owner_home/domain/repos/owner_home_repo.dart';
import 'package:snap_shot/features/owner_home/domain/use_cases/get_stats_data_use_case.dart';
import 'package:snap_shot/features/owner_home/presentation/manager/stats_cubit/get_stats_data_cubit.dart';
import 'package:snap_shot/features/owner_home/presentation/manager/get_all_users/get_all_users_cubit.dart';

Future<void> setupOwnerGetIt() async {
  // Features
  _initOwenrHomeFeature();
  _initAllUsersFeature();
  _initOwenrAllOrdersFeature();
}

void _initAllUsersFeature() {
  //local Serivces

  sl.registerLazySingleton<ILocalDataBaseServices<UserModel>>(
    () => HiveServices<UserModel>(HiveBoxesNames.instance.allUsersBox),
    instanceName: HiveBoxesNames.instance.allUsersBox,
  );
  sl.registerLazySingleton<ILocalDataBaseServices<String>>(
    () => HiveServices<String>(HiveBoxesNames.instance.dataVrsions),
    instanceName: HiveBoxesNames.instance.dataVrsions,
  );

  sl.registerLazySingleton<ILocalDataBaseServices<String>>(
    () => HiveServices<String>(HiveBoxesNames.instance.usersIdsBox),
    instanceName: HiveBoxesNames.instance.usersIdsBox,
  );

  //data source
  sl.registerLazySingleton<AllUsersLocalDataSource>(
    () => AllUsersLocalDataSourceImpl(
      sl<ILocalDataBaseServices<UserModel>>(
        instanceName: HiveBoxesNames.instance.allUsersBox,
      ),
      sl<ILocalDataBaseServices<String>>(
        instanceName: HiveBoxesNames.instance.usersIdsBox,
      ),
      sl<ILocalDataBaseServices<String>>(
        instanceName: HiveBoxesNames.instance.dataVrsions,
      ),
    ),
  );

  sl.registerLazySingleton<AllUsersRemoteDataSource>(
    () => AllUsersRemoteDataSourecImpl(sl<IRemoteDataBaseServices>()),
  );

  // repos
  sl.registerLazySingleton<AllUsersRepo>(
    () => AllUsersRepoImpl(
      sl<AllUsersRemoteDataSource>(),
      sl<AllUsersLocalDataSource>(),
    ),
  );
  //use cases
  sl.registerLazySingleton(() => GetAllUserUseCase(sl<AllUsersRepo>()));
  sl.registerLazySingleton(
    () => SyncCacheWithRemoteUseCase(sl<AllUsersRepo>()),
  );

  // cubits
  sl.registerFactory(
    () => GetAllUsersCubit(
      sl<GetAllUserUseCase>(),
      sl<SyncCacheWithRemoteUseCase>(),
    ),
  );
}

void _initOwenrHomeFeature() {
  //data source
  sl.registerLazySingleton<OwnerHomeRemoteDataSource>(
    () => OwnerHomeRemoteImpl(sl<IRemoteDataBaseServices>()),
  );

  // repos
  sl.registerLazySingleton<OwnerHomeRepo>(
    () => OwnerHomeRepoImpl(sl<OwnerHomeRemoteDataSource>()),
  );
  //use cases
  sl.registerLazySingleton(() => GetStatsDataUseCase(sl<OwnerHomeRepo>()));

  // cubits
  sl.registerFactory(() => GetStatsDataCubit(sl<GetStatsDataUseCase>()));
}

void _initOwenrAllOrdersFeature() {
  //data source
  sl.registerLazySingleton<AllOrdersRemoteDataSource>(
    () => AllOrdersRemoteDataSourceImpl(sl<IRemoteDataBaseServices>()),
  );

  // repos
  sl.registerLazySingleton<AllOrdersRepo>(
    () => AllOrdersRepoImpl(sl<AllOrdersRemoteDataSource>()),
  );
  //use cases
  sl.registerLazySingleton(() => GetAllOrdersUseCase(sl<AllOrdersRepo>()));

  // cubits
  sl.registerFactory(() => GetAllAppOrdersCubit(sl<GetAllOrdersUseCase>()));
}
