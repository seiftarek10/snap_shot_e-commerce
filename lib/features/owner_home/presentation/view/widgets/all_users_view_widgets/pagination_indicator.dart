

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/features/owner_home/presentation/manager/cubit/get_all_users_cubit.dart';

class AllUsersPaginationCircleIndicator extends StatelessWidget {
  const AllUsersPaginationCircleIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllUsersCubit, GetAllUsersState>(
      builder: (context, state) {
        if (state is GetAllUsersPaginationLoading) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.instance.black,
                ),
              ),
            ),
          );
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}