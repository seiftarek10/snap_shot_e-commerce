part of 'get_all_users_cubit.dart';

@immutable
sealed class GetAllUsersState {
  const GetAllUsersState();
}

final class GetAllUsersInitial extends GetAllUsersState {
  const GetAllUsersInitial();
}

final class GetAllUsersLoading extends GetAllUsersState {
  const GetAllUsersLoading();
}

// 1. New pagination loading state that retains current users on screen
final class GetAllUsersPaginationLoading extends GetAllUsersState {
  const GetAllUsersPaginationLoading(this.users);
  final List<UserEntity> users;
}

final class GetAllUsersSuccess extends GetAllUsersState {
  // 2. This must receive the master list, not just the single batch
  const GetAllUsersSuccess(this.users);
  final List<UserEntity> users;
}

final class GetAllUsersFailure extends GetAllUsersState {
  const GetAllUsersFailure({required this.errMessage});
  final String errMessage;
}