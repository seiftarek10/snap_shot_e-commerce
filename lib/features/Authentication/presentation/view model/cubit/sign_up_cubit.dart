import 'package:meta/meta.dart';
import 'package:snap_shot/core/bloc/base_cubit.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/sing_up_param.dart';
import 'package:snap_shot/features/authentication/domain/use_case/sign_up_use_case.dart';

part 'sign_up_state.dart';

class SignUpCubit extends BaseCubit<SignUpState> {
  SignUpCubit(this._signUpUseCase) : super(SignUpInitial());
  final SignUpUseCase _signUpUseCase;

  Future<void> signUp({required SignUpParam signUpParam}) async {
    safeEmit(SignUpLoading());
    final result = await _signUpUseCase.call(signUpParam);
    if (result is Success) {
      safeEmit(SignUpSuccess());
    } else if (result is ErrorCase) {
      safeEmit(SignUpFailure(errMessaga: result.failure.errMessage));
    }
  }
}
