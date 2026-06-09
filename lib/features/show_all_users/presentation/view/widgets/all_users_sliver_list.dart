import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/features/show_all_users/presentation/manager/get_all_users/get_all_users_cubit.dart';
import 'package:snap_shot/features/show_all_users/presentation/view/widgets/card_item.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_empty_widget.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_error_widget.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_loading_widget.dart';

class AllUsersSliverList extends StatelessWidget {
  const AllUsersSliverList({super.key});

  @override
Widget build(BuildContext context) {
  return BlocBuilder<GetAllUsersCubit, GetAllUsersState>(
    builder: (context, state) {
      if (state is GetAllUsersSuccess || state is GetAllUsersPaginationLoading) {
        final List<UserEntity> users = (state is GetAllUsersSuccess) 
            ? state.users 
            : (state as GetAllUsersPaginationLoading).users;

        if (users.isEmpty) {
          return _buildEmptyList();
        }
        return _buildSuccessList(users);
      } else if (state is GetAllUsersFailure) {
        return _buildErrorWidget(context, state.errMessage);
      } else {
        return _buildLoadingList(); 
      }
    },
  );
}

  SliverList _buildLoadingList() {
    return SliverList.builder(
      itemCount: 20,
      itemBuilder: (consext, index) {
        return AppLoadingWidget(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: const AllUsersCardItem(
              userName: '',
              phoneNumber: '',
              address: '',
            ),
          ),
        );
      },
    );
  }

  SliverList _buildSuccessList(List<UserEntity> users) {
    return SliverList.builder(
      itemCount: users.length,
    
      itemBuilder: (consext, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: AllUsersCardItem(
            userName: users[index].userName,
            phoneNumber: users[index].mobile,
            address: users[index].address,
          ),
        );
      },
    );
  }

  SliverFillRemaining _buildEmptyList() {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(child: AppEmptyWidget()),
    );
  }

  SliverFillRemaining _buildErrorWidget(
    BuildContext context,
    String errMessage,
  )  {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: AppErrorWidget(
          errMessage: errMessage,
          onTap: () async {
            await context.read<GetAllUsersCubit>().getAllUsers();
          },
        ),
      ),
    );
  }
}
