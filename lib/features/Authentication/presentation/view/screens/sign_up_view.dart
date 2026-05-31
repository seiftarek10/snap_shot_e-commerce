import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/features/authentication/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/auth_page_title.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/or_divider.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/sign_up_widgets/have_account.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/sign_up_widgets/sign_up_form.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<SignUpCubit>(),

      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: PagePadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpace.instance.topPageSpace,
                  const AuthPageTitle(title: 'Create Your Account'),
                  AppSpace.instance.v12,
                  const SignUpForm(),
                  AppSpace.instance.v12,
                  const OrDivider(),
                  AppSpace.instance.v16,
                  const Center(child: HaveAccount()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
