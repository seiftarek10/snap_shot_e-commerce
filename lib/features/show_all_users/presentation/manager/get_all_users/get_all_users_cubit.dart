import 'package:meta/meta.dart';
import 'package:snap_shot/core/bloc/base_cubit.dart';
import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/domain/use_cases/check_data_consistent_use_case.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/domain/use_cases/get_all_user_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';

part 'get_all_users_state.dart';

class GetAllUsersCubit extends BaseCubit<GetAllUsersState> {
  GetAllUsersCubit(this._getAllUserUseCase, this._syncCacheWithRemoteUseCase)
    : super(const GetAllUsersInitial());

  final GetAllUserUseCase _getAllUserUseCase;
  final SyncCacheWithRemoteUseCase _syncCacheWithRemoteUseCase;

  String? lastId;
  List<UserEntity> users = [];
  bool hasMoreData = true;
  final int limit = 10;

  Future<void> getAllUsers({bool isPagination = false}) async {
    if (isPagination && !hasMoreData) return;

    if (isPagination) {
      safeEmit(GetAllUsersPaginationLoading(List.from(users)));
    } else {
      lastId = null;
      users.clear();
      hasMoreData = true;
      safeEmit(const GetAllUsersLoading());
    }

    final result = await _getAllUserUseCase.call(
      GetAllUserParams(limit: limit, lastId: lastId),
    );

    if (result is Success<List<UserEntity>>) {
      if (result.data.length < limit) {
        hasMoreData = false;
      }

      if (result.data.isNotEmpty) {
        lastId = result.data.last.uid;
        users.addAll(result.data);
      }

      safeEmit(GetAllUsersSuccess(List.from(users)));
        await _syncCacheWithRemoteUseCase.call(null);

    } else if (result is AppFailure<List<UserEntity>>) {
      if (isPagination) {
        safeEmit(GetAllUsersSuccess(List.from(users)));
        await _syncCacheWithRemoteUseCase.call(null);
      } else {
        safeEmit(GetAllUsersFailure(errMessage: result.failure.errMessage));
      }
    }
  }
}
