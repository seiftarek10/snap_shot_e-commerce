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

final class GetAllUsersPaginationLoading extends GetAllUsersState {
  const GetAllUsersPaginationLoading(this.users);
  final List<UserEntity> users;
}

final class GetAllUsersSuccess extends GetAllUsersState {
  const GetAllUsersSuccess(this.users);
  final List<UserEntity> users;
}

final class GetAllUsersFailure extends GetAllUsersState {
  const GetAllUsersFailure({required this.errMessage});
  final String errMessage;
}