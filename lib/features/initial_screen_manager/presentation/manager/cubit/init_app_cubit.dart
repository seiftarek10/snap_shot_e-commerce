import 'package:meta/meta.dart';
import 'package:snap_shot/core/bloc/base_cubit.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/initial_screen_manager/domain/use_cases/is_first_time_use_case.dart';
import 'package:snap_shot/features/initial_screen_manager/domain/use_cases/is_logged_in_use_case.dart';

part 'init_app_state.dart';

class InitAppCubit extends BaseCubit<InitAppState> {
  InitAppCubit(this._isFirstTimeUseCase, IsLoggedInUseCase isLoggedInUseCase)
    : _isLoggedInUseCase = isLoggedInUseCase,
      super(const InitAppInitial());

  final IsFirstTimeUseCase _isFirstTimeUseCase;
  final IsLoggedInUseCase _isLoggedInUseCase;

  Future<void> checkInitState() async {
    safeEmit(const InitAppLoading());
    final isFirstTime = await _isFirstTimeUseCase.call(null);
    final isLoggedIn = _isLoggedInUseCase.call(null);
    if (isFirstTime is Success<bool> && isLoggedIn is Success<bool>) {
      if (isFirstTime.data == true) {
        safeEmit(const IsFirstTime());
        return;
      } else if (isFirstTime.data == false && isLoggedIn.data == false) {
        safeEmit(const IsNotFirstTimeAndNotLoggedIn());
        return;
      } else if (isFirstTime.data == false && isLoggedIn.data == true) {
        safeEmit(const IsNotFirstTimeAndLoggedIn());
        return;
      }
    } else if (isFirstTime is AppFailure<bool>) {
      emit(InitAppFailure(isFirstTime.failure.errMessage));
    } else if (isLoggedIn is AppFailure<bool>) {
      emit(InitAppFailure(isLoggedIn.failure.errMessage));
    }
  }
}
