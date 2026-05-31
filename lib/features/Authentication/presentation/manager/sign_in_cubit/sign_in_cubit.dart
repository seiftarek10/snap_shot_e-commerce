import 'package:meta/meta.dart';
import 'package:snap_shot/core/bloc/base_cubit.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/sign_in_param.dart';
import 'package:snap_shot/features/authentication/domain/use_case/sing_in_use_case.dart';

part 'sign_in_state.dart';

class SignInCubit extends BaseCubit<SignInState> {
  SignInCubit(this._singInUseCase) : super(const SignInInitial());
  final SignInUseCase _singInUseCase;

  Future<void> signIn({required String email, required String password}) async {
    safeEmit(const SignInLoading());
    final result = await _singInUseCase.call(SignInParam(email, password));
    if (result is Success<void>) {
      safeEmit(const SignInSuccess());
    }
    if (result is AppFailure<void>) {
      safeEmit(SignInFailure(result.failure.errMessage));
    }
  }
}
