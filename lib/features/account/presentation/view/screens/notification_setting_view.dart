import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';
import 'package:snap_shot/features/account/presentation/view/widgets/notifications/notification_switcher.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';

class NotificationSettingView extends StatelessWidget {
  const NotificationSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PagePadding(
          child: Column(
            children: [
              AppSpace.instance.topPageSpace,
              const PageHeader(pageTitle: 'Notifications', arrowBack: true),
              AppSpace.instance.v20,
              const NotificationsSwitcher(
                label: 'App Notifications',
                isOn: false,
              ),
              AppSpace.instance.v20,
              const NotificationsSwitcher(
                label: 'Email Notifications',
                isOn: false,
              ),
              AppSpace.instance.v20,

              const NotificationsSwitcher(
                label: 'SMS Notifications',
                isOn: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
