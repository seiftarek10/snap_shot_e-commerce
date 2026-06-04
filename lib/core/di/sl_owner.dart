import 'package:snap_shot/core/data_source/local_data_source/Hive/hive_boxes_names.dart';
import 'package:snap_shot/core/data_source/local_data_source/Hive/hive_services.dart';
import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/service_interface.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/data/data_source/local_data_source/all_users_local_data_source.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/data/data_source/local_data_source/all_users_local_data_source_impl.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/data/data_source/remote_data_source/all_users_remote_data_source.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/data/data_source/remote_data_source/all_users_remote_data_sourec_impl.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/data/repos/all_users_repo_impl.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/domain/repos/all_users_repo.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/domain/use_cases/get_all_user_use_case.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/owner_home/presentation/manager/cubit/get_all_users_cubit.dart';



 Future<void> setupOwnerGetIt() async {
 

  // Features
  _initOwnerHomeFeaure();
}

void _initOwnerHomeFeaure() {
  //local Serivces

  sl.registerLazySingleton<ILocalDataBaseServices<UserModel>>(
    () => HiveServices<UserModel>(HiveBoxesNames.instance.allUsersBox),
    instanceName: HiveBoxesNames.instance.allUsersBox,
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

  // cubits
  sl.registerFactory(() => GetAllUsersCubit(sl<GetAllUserUseCase>()));
}





