import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/core/utils/show_snack_bar.dart';
import 'package:snap_shot/core/utils/validator.dart';
import 'package:snap_shot/features/authentication/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:snap_shot/shared/widgets/app_button.dart';
import 'package:snap_shot/shared/widgets/app_text_filed.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> key = GlobalKey();

    String? userName, password, email, mobile, address;

    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          AppSnackBar.show(context, message: state.errMessaga, isError: true);
        }
        if (state is SignUpSuccess) {
          AppSnackBar.show(context, message: 'Welcome');
          context.go(Routes.instance.appShell);
        }
        // if (state is SendOtpSuccess) {
        //   AppSnackBar.show(context, message: 'Welcome');
        //   final OtpArgsModel otpArgs = OtpArgsModel(
        //     user: UserEntity(
        //       email: email!,
        //       password: password!,
        //       userName: userName!,
        //       mobile: mobile!,
        //       address: address!,
        //       uid: '',
        //     ),
        //     verificationId: state.verificationId,
        //   );
        //   context.push(Routes.instance.otpView, extra: otpArgs);
        // }
      },
      child: Form(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(
              hintText: 'Username',
              validator: (value) {
                return ValidationForm.nullOrEpmty(value);
              },
              onSaved: (user) {
                userName = user;
              },
              keyboardType: TextInputType.text,
            ),
            AppSpace.instance.v8,
            AppTextField(
              hintText: 'Email',
              validator: (value) {
                return ValidationForm.validEmail(value);
              },
              onSaved: (value) {
                email = value;
              },
              keyboardType: TextInputType.text,
            ),
            AppSpace.instance.v8,
            AppTextField(
              validator: (value) {
                return ValidationForm.validPassword(value);
              },
              hintText: 'Password',
              onSaved: (value) {
                password = value;
              },
              keyboardType: TextInputType.text,
              isPasswordField: true,
            ),
            AppSpace.instance.v8,
            AppTextField(
              hintText: 'Mobile',
              validator: (value) {
                return ValidationForm.validPhoneNumber(value);
              },
              onSaved: (value) {
                mobile = '+2$value';
              },
              keyboardType: TextInputType.text,
            ),
            AppSpace.instance.v8,
            AppTextField(
              validator: (value) {
                return ValidationForm.nullOrEpmty(value);
              },
              hintText: 'Address',
              maxLines: 2,
              onSaved: (value) {
                address = value;
              },
              keyboardType: TextInputType.text,
            ),
            AppSpace.instance.v16,

            BlocBuilder<SignUpCubit, SignUpState>(
              builder: (context, state) {
                return AppButton(
                  isLoading: state is SignUpLoading,
                  buttonTitle: 'Sign Up',
                  onPressed: state is SignUpLoading
                      ? () {
                          log('Loading');
                        }
                      : () {
                          if (key.currentState!.validate()) {
                            key.currentState!.save();
                            context.read<SignUpCubit>().signUp(
                              userData: UserEntity(
                                email: email!,
                                password: password!,
                                userName: userName!,
                                mobile: mobile!,
                                address: address!,
                                uid: '',
                              ),
                            );
                            // context.read<SignUpCubit>().sendOtp(phoneNumber: mobile!);
                          }
                        },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
