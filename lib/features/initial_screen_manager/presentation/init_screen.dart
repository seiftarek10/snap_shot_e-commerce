import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/core/routing/app_router.dart';
import 'package:snap_shot/core/routing/app_shell/app_shell.dart';
import 'package:snap_shot/features/authentication/presentation/view/screens/sign_in_view.dart';
import 'package:snap_shot/features/initial_screen_manager/presentation/manager/cubit/init_app_cubit.dart';
import 'package:snap_shot/features/on_boarding/presentation/view/screens/on_boarding_view.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key, required this.role});

  final Role role;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<InitAppCubit>()..checkInitState(),
      child: BlocBuilder<InitAppCubit, InitAppState>(
        builder: (context, state) {
          if (state is InitAppLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is IsFirstTime) {
            return const OnBoardingView();
          } else if (state is IsNotFirstTimeAndLoggedIn) {
            return AppShell(pageIndex: 0, role: role);
          } else if (state is IsNotFirstTimeAndNotLoggedIn) {
            return const SignInView();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
