import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/otp/otp_fields.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/otp/resend_counter.dart';
import 'package:snap_shot/shared/widgets/app_button.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PagePadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppSpace.instance.topPageSpace,
              const PageHeader(
                pageTitle: 'Verify phone number',
                arrowBack: true,
              ),
              AppSpace.instance.v50,
              OtpFields(onSubmit: (String verificationCode) {}),
              AppSpace.instance.v12,
              const ResendCounter(),
              AppSpace.instance.v50,
              AppSpace.instance.v50,
              AppButton(
                buttonTitle: 'Verify',
                onPressed: () {},
                isClicked: false,
              ),
              AppSpace.instance.v50,
            ],
          ),
        ),
      ),
    );
  }
}
