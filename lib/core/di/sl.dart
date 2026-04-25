import 'package:get_it/get_it.dart';
import 'package:snap_shot/core/services/data_base/data_base_services_interfase.dart';
import 'package:snap_shot/core/services/data_base/firebase_firestore_service.dart';
import 'package:snap_shot/features/authentication/data/data_source/remote/firebase_auth_services.dart';
import 'package:snap_shot/features/authentication/data/repos/auth_repo_impl.dart';
import 'package:snap_shot/features/authentication/domain/repos/auth_repo.dart';
import 'package:snap_shot/features/authentication/domain/use_case/send_otp_use_case.dart';
import 'package:snap_shot/features/authentication/domain/use_case/sign_up_use_case.dart';
import 'package:snap_shot/features/authentication/domain/use_case/verify_otp_use_case.dart';
import 'package:snap_shot/features/authentication/presentation/view%20model/sign_up/sign_up_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<IDataBaseServices>(
    () => FirebaseFirestoreService(),
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(FirebaseAuthServices(getIt.get<IDataBaseServices>())),
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
}
