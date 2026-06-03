import 'package:meta/meta.dart';
import 'package:snap_shot/core/bloc/base_cubit.dart';
import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/domain/use_cases/get_all_user_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';

part 'get_all_users_state.dart';

class GetAllUsersCubit extends BaseCubit<GetAllUsersState> {
  GetAllUsersCubit(this._getAllUserUseCase) : super(const GetAllUsersInitial());

  final GetAllUserUseCase _getAllUserUseCase;

  String? lastId;
  List<UserEntity> users = [];
  Future<void> getAllUsers() async {
    final result = await _getAllUserUseCase.call(
      GetAllUserParams(limit: 2, lastId: lastId),
    );
    if (result is Success<List<UserEntity>>) {
      if (result.data.isNotEmpty) {
        lastId = result.data.last.uid;
      }
      users.addAll(result.data);
      safeEmit(GetAllUsersSuccess(users));
    } else if (result is AppFailure<List<UserEntity>>) {
      safeEmit(GetAllUsersFailure(errMessage: result.failure.errMessage));
    }
  }
}
