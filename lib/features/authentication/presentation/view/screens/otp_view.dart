import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/utils/show_snack_bar.dart';
import 'package:snap_shot/features/authentication/presentation/model/otp_args_model.dart';
import 'package:snap_shot/features/authentication/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/otp/otp_fields.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/otp/resend_counter.dart';
import 'package:snap_shot/shared/widgets/app_button.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key, required this.otpArgs});
  final OtpArgsModel otpArgs;

  @override
  Widget build(BuildContext context) {
    String smsCode = '';
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) async {
        if (state is VerifyOtpFailure) {
          AppSnackBar.show(context, message: state.errMessaga, isError: true);
        }
        if (state is VerifyOtpSuccess) {
          await context.read<SignUpCubit>().signUp(userData: otpArgs.user);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: PagePadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppSpace.instance.topPageSpace,
                const AppPageTitle(
                  pageTitle: 'Verify phone number',
                  arrowBack: true,
                ),
                AppSpace.instance.v50,
                OtpFields(
                  onSubmit: (String verificationCode) {
                    smsCode = verificationCode;
                  },
                ),
                AppSpace.instance.v12,
                const ResendCounter(),
                AppSpace.instance.v50,
                AppSpace.instance.v50,
                BlocBuilder<SignUpCubit, SignUpState>(
                  builder: (context, state) {
                    return AppButton(
                      buttonTitle: 'Verify',
                      onPressed: () async {
                        await context.read<SignUpCubit>().verifyOtp(
                          verificationId: otpArgs.verificationId,
                          otp: smsCode,
                        );
                      },
                      isLoading: state is SignUpLoading,
                    );
                  },
                ),
                AppSpace.instance.v50,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
