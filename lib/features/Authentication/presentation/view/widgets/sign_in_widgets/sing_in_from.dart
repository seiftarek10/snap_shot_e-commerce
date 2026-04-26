import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/core/utils/show_snack_bar.dart';
import 'package:snap_shot/core/utils/validator.dart';
import 'package:snap_shot/features/authentication/presentation/view%20model/cubit/sign_in_cubit.dart';
import 'package:snap_shot/shared/widgets/app_button.dart';
import 'package:snap_shot/shared/widgets/app_text_filed.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String eamil = '';
    String password = '';
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          AppSnackBar.show(context, message: state.errorMessage, isError: true);
        }
        if (state is SignInSuccess) {
          context.push(Routes.instance.appShell);
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(
              validator: (value) {
                return ValidationForm.validEmail(value);
              },
              hintText: 'Email',
              onSaved: (value) {
                eamil = value!;
              },
              keyboardType: TextInputType.emailAddress,
            ),
            AppSpace.instance.v8,
            AppTextField(
              validator: (value) {
                return ValidationForm.validPassword(value);
              },
              hintText: 'Password',
              isPasswordField: true,
              onSaved: (value) {
                password = value!;
              },
              keyboardType: TextInputType.visiblePassword,
            ),
            AppSpace.instance.v12,
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(
                  overlayColor: AppColors.instance.darkGrey,
                ),
                onPressed: () {
                  context.push(Routes.instance.forgetPassword);
                },
                child: Text(
                  'Forgot Password?',
                  style: AppTextStyle.instance.text12W500Black,
                ),
              ),
            ),
            AppSpace.instance.v12,
            BlocBuilder<SignInCubit, SignInState>(
              builder: (context, state) {
                return AppButton(
                  isClicked: state is SignInLoading,
                  buttonTitle: 'Sign In',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      await context.read<SignInCubit>().signIn(
                        email: eamil,
                        password: password,
                      );
                    }
                  },
                );
              },
            ),
            AppSpace.instance.v8,
          ],
        ),
      ),
    );
  }
}
