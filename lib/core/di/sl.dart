import 'package:get_it/get_it.dart';
import 'package:snap_shot/features/authentication/data/data_source/remote/firebase_auth_services.dart';
import 'package:snap_shot/features/authentication/data/repos/auth_repo_impl.dart';
import 'package:snap_shot/features/authentication/domain/repos/auth_repo.dart';
import 'package:snap_shot/features/authentication/domain/use_case/sign_up_use_case.dart';
import 'package:snap_shot/features/authentication/presentation/view%20model/cubit/sign_up_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(FirebaseAuthServices()),
  );
  getIt.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(getIt.get<AuthRepo>()),
  );
  getIt.registerFactory<SignUpCubit>(
    () => SignUpCubit(getIt.get<SignUpUseCase>()),
  );
}
