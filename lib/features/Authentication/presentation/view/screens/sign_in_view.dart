import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/features/authentication/presentation/manager/sign_in_cubit/sign_in_cubit.dart';

import 'package:snap_shot/shared/widgets/page_padding.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/auth_page_title.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/or_divider.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/sign_in_widgets/no_account.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/sign_in_widgets/sing_in_from.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<SignInCubit>(),
      child: Scaffold(
        
        body: SafeArea(
          child: SingleChildScrollView(
            child: PagePadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppSpace.instance.topPageSpace,
                  AppSpace.instance.topPageSpace,
                  const AuthPageTitle(title: "Welcome Back!"),
                  AppSpace.instance.v16,
                  const SignInForm(),
                  AppSpace.instance.v12,
                  const OrDivider(),
                  AppSpace.instance.v16,
                  const Center(child: NoAccount()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
