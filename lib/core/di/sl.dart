import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:snap_shot/core/data_source/remote_data_source/api/dio_services.dart';
import 'package:snap_shot/core/data_source/remote_data_source/api/api_interface.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/fire_base/firebase_firestore_service.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/service_interface.dart';
import 'package:snap_shot/core/di/sl_owner.dart';
import 'package:snap_shot/core/di/sl_user.dart';
import 'package:snap_shot/core/routing/app_router.dart';

final sl = GetIt.instance;

Future<void> setupGetIt(Role role) async {
  // Core / External
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<IApiServices>(() => DioServices(sl<Dio>()));
  sl.registerLazySingleton<IRemoteDataBaseServices>(
    () => FirebaseFirestoreService(),
  );

  if (role == Role.user) {
    await setupUserGetIt();
  }
  if (role == Role.owner) {
   await setupOwnerGetIt();
  }
}
